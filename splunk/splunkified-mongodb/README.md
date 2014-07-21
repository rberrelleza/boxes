Splunkified MongoDB
=====

ElasticBox box that deploys a MongoDB instance configured to forward its logs to a Splunk instance

Instructions
---
1. Create a new box, with the name "Splunkified MongoDB" and the service type "Linux Compute"
2. Add the following variables
  + mongodb, type box, value MongoDB Server
  + forwarder, type box, value Linux Universal Forwarder
3. Override the value of forwarder.MONITORING_PATH with /var/log/mongod/*
  
This box will install mongodb from 10gen's repository, and on success, will configure the server to forward all the logs generated under /var/log/mongod to the selected Splunk instance. 