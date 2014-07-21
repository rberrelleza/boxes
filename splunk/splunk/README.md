Splunk
=====

ElasticBox box that deploys an standalone instance of Splunk

Instructions
---
1. Create a new box, with the name "Splunk" and service type "Linux Compute"
2. Add the install.sh and stop.sh scripts included in this folder
3. Add the following variables
  + FORWARDER, type port, value 9997
  + INSTALLER, type text, value http://www.splunk.com/page/download_track?file=6.1.1/splunk/linux/splunk-6.1.1-207789-Linux-x86_64.tgz&ac=&wget=true&name=wget&platform=Linux&architecture=x86_64&version=6.1.1&product=splunk&typed=release
  + MANAGEMENT, type port, value 8089
  + WEBUI, type port, value 8000
4. After deployment, browse to http://INSTANCE_IP:8000. Follow onscreen instructions to create a new user.