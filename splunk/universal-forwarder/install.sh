#!/bin/bash
if [[ -e "/opt/splunkforwarder/bin/splunk" ]]; then
   /opt/splunkforwarder/bin/splunk stop
fi

wget -q -O splunkforwarder.tar.gz "$INSTALLER"

if [[ ! $? -eq 0 ]]; then
  echo "Error downloading the installer from $INSTALLER"
  exit 1
fi

if [[ ! "/opt" ]]; then
  mkdir /opt
fi

tar xvzf splunkforwarder.tar.gz -C /opt --overwrite > /dev/null

if [[ ! $? -eq 0 ]]; then
  echo "Error extracting the file"
  exit 1
fi

/opt/splunkforwarder/bin/splunk enable boot-start --answer-yes --no-prompt --accept-license
/opt/splunkforwarder/bin/splunk start 