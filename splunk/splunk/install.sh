#!/bin/bash

if [[ -d "/opt/splunk/bin/splunk" ]]; then
   /opt/splunk/bin/splunk stop
fi

wget -q -O splunk.tar.gz "$INSTALLER"

if [[ ! $? -eq 0 ]]; then
  echo "Error downloading the installer from $INSTALLER"
  exit 1
fi

if [[ ! "/opt" ]]; then
  mkdir /opt
fi

tar xvzf splunk.tar.gz -C /opt --overwrite > /dev/null

if [[ ! $? -eq 0 ]]; then
  echo "Error extracting the file"
  exit 1
fi

/opt/splunk/bin/splunk enable boot-start --answer-yes --no-prompt --accept-license
/opt/splunk/bin/splunk enable listen $FORWARDER
/opt/splunk/bin/splunk start