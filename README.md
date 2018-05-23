docker-activemq
===============

[![Build Status](https://travis-ci.org/rmohr/docker-activemq.svg?branch=master)](https://travis-ci.org/rmohr/docker-activemq)
[![Docker Pulls](https://img.shields.io/docker/pulls/rmohr/activemq.svg?maxAge=2592000)](https://hub.docker.com/r/rmohr/activemq/)

[Docker](https://www.docker.io/) file for trusted builds of [ActiveMQ](http://activemq.apache.org/) on https://registry.hub.docker.com/u/rmohr/activemq/.

Run the latest container with:

    docker pull rmohr/activemq
    docker run -p 61616:61616 -p 8161:8161 rmohr/activemq

The JMX broker listens on port 61616 and the Web Console on port 8161.

Image Tags
----------

    rmohr/activemq:latest (rmohr/activemq:5.15.4)
    rmohr/activemq:5.10.0
    rmohr/activemq:5.10.1
    rmohr/activemq:5.10.2
    rmohr/activemq:5.11.0
    rmohr/activemq:5.11.1
    rmohr/activemq:5.12.0
    rmohr/activemq:5.12.1
    rmohr/activemq:5.12.2
    rmohr/activemq:5.13.0
    rmohr/activemq:5.13.1
    rmohr/activemq:5.13.2
    rmohr/activemq:5.13.3
    rmohr/activemq:5.13.4
    rmohr/activemq:5.14.0
    rmohr/activemq:5.14.0-alpine
    rmohr/activemq:5.14.1
    rmohr/activemq:5.14.1-alpine
    rmohr/activemq:5.14.2
    rmohr/activemq:5.14.2-alpine
    rmohr/activemq:5.14.3
    rmohr/activemq:5.14.3-alpine
    rmohr/activemq:5.14.4
    rmohr/activemq:5.14.4-alpine
    rmohr/activemq:5.14.5
    rmohr/activemq:5.14.5-alpine
    rmohr/activemq:5.15.2
    rmohr/activemq:5.15.2-alpine
    rmohr/activemq:5.15.3
    rmohr/activemq:5.15.3-alpine
    rmohr/activemq:5.15.4
    rmohr/activemq:5.15.4-alpine

Port Map
--------

    61616 JMS
    8161  UI
    5672  AMQP  (since `rmohr/activemq:5.12.1`)
    61613 STOMP (since `rmohr/activemq:5.12.1`)
    1883  MQTT  (since `rmohr/activemq:5.12.1`)
    61614 WS    (since `rmohr/activemq:5.12.1`)

Customizing configuration and persistence location
--------------------------------------------------

ActiveMQ checks your environment for the variables *ACTIVEMQ_BASE*, *ACTIVEMQ_CONF* and *ACTIVEMQ_DATA*.
Just override them with your desired location:

    docker run -p 61616:61616 -p 8161:8161 -e ACTIVEMQ_CONF=/etc/activemq/conf -e ACTIVEMQ_DATA=/var/lib/activemq/data rmohr/activemq

As an alternative you can just mount your persistent config and data directories into the default location:

    docker run -p 61616:61616 -p 8161:8161 -v /opt/activemq/conf:/opt/activemq/conf -v /opt/activemq/data:/opt/activemq/data rmohr/activemq
