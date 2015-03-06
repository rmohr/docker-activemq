docker-activemq
===============

[Docker](https://www.docker.io/) file for trusted builds of [ActiveMQ](http://activemq.apache.org/) on https://registry.hub.docker.com/u/rmohr/activemq/.

Run the latest container with:

      docker pull rmohr/activemq
      docker run -p 61616:61616 -p 8161:8161 rmohr/activemq
  
The Broker listens on port 61616 and the Web Console on port 8161.

Customizing configuration and persistence location
--------------------------------------------------

ActiveMQ checks your environment for the variables *ACTIVEMQ_BASE*, *ACTIVEMQ_CONF* and *ACTIVEMQ_DATA*.
Just override them with your desired location:

      docker run -p 61616:61616 -p 8161:8161 -e ACTIVEMQ_CONF=/etc/activemq/conf -e ACTIVEMQ_DATA=var/lib/activemq/data rmohr/activemq

As an alternative you can just mount your persistent config and data directories into the default location:

      docker run -p 61616:61616 -p 8161:8161 -v /opt/activemq/conf:/opt/activemq/conf -v /var/activemq/data:/var/activemq/data rmohr/activemq
