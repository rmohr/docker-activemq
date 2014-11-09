docker-activemq
===============

[Docker](https://www.docker.io/) file for the trusted build of [ActiveMQ-5.10.0](http://activemq.apache.org/) on https://registry.hub.docker.com/u/rmohr/activemq/.

Run the container with:

      docker pull rmohr/activemq
      docker run -p 61616:61616 -p 8161:8161 rmohr/activemq
  
The Broker listens on port 61616 and the Web Console on port 8161.
