#!/bin/bash
if [[ -e "/opt/splunkforwarder/bin/splunk" ]]; then
   echo "Starting splunk forwarder"
   /opt/splunkforwarder/bin/splunk start
else
  echo "Splunk is not installed, skipping"
fi

echo "Adding the forward-server pointing to $SPLUNK.FORWARDER"
/opt/splunkforwarder/bin/splunk add forward-server $SPLUNK.address.public:$SPLUNK.FORWARDER -auth $USERNAME:$PASSWORD
result=$?
if [[ $result -eq 0 ]] || [[ $result -eq 22 ]]; then
  echo "Added the forward-server"
else
  echo "Error when adding the forward-server"
  exit 1
fi

echo "Removing the monitor if it exists"
/opt/splunkforwarder/bin/splunk remove monitor "$MONITORING_PATH"

echo "Adding a new monitor"
/opt/splunkforwarder/bin/splunk add monitor "$MONITORING_PATH" -index main -sourcetype $instance

if [[ ! $? -eq 0 ]]; then
  echo "Error when adding the monitor"
  exit 1
fi

/opt/splunkforwarder/bin/splunk restart

if [[ ! $? -eq 0 ]]; then
  echo "Error when restarting the forwarder"
  exit 1
fi