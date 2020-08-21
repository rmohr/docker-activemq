docker-activemq
===============

[![Build Status](https://travis-ci.org/astraube/docker-activemq.svg?branch=master)](https://travis-ci.org/astraube/docker-activemq)
[![Docker Pulls](https://img.shields.io/docker/pulls/astraube/activemq.svg?maxAge=2592000)](https://hub.docker.com/r/astraube/activemq/)

[Docker](https://www.docker.io/) file for trusted builds of [ActiveMQ](http://activemq.apache.org/) on https://registry.hub.docker.com/u/astraube/activemq/.

Run the latest container with:

    docker pull astraube/activemq
    docker run -p 61616:61616 -p 8161:8161 astraube/activemq

The JMX broker listens on port 61616 and the Web Console on port 8161.

Image Tags
----------

    astraube/activemq:latest (astraube/activemq:5.15.9)
    astraube/activemq:5.10.0
    astraube/activemq:5.10.1
    astraube/activemq:5.10.2
    astraube/activemq:5.11.0
    astraube/activemq:5.11.1
    astraube/activemq:5.12.0
    astraube/activemq:5.12.1
    astraube/activemq:5.12.2
    astraube/activemq:5.13.0
    astraube/activemq:5.13.1
    astraube/activemq:5.13.2
    astraube/activemq:5.13.3
    astraube/activemq:5.13.4
    astraube/activemq:5.14.0
    astraube/activemq:5.14.0-alpine
    astraube/activemq:5.14.1
    astraube/activemq:5.14.1-alpine
    astraube/activemq:5.14.2
    astraube/activemq:5.14.2-alpine
    astraube/activemq:5.14.3
    astraube/activemq:5.14.3-alpine
    astraube/activemq:5.14.4
    astraube/activemq:5.14.4-alpine
    astraube/activemq:5.14.5
    astraube/activemq:5.14.5-alpine
    astraube/activemq:5.15.2
    astraube/activemq:5.15.2-alpine
    astraube/activemq:5.15.3
    astraube/activemq:5.15.3-alpine
    astraube/activemq:5.15.4
    astraube/activemq:5.15.4-alpine
    astraube/activemq:5.15.5
    astraube/activemq:5.15.5-alpine
    astraube/activemq:5.15.6
    astraube/activemq:5.15.6-alpine
    astraube/activemq:5.15.9
    astraube/activemq:5.15.9-alpine
    astraube/activemq:5.15.10
    astraube/activemq:5.15.10-alpine
    astraube/activemq:5.15.11
    astraube/activemq:5.15.11-alpine
    astraube/activemq:5.15.12
    astraube/activemq:5.15.12-alpine

Port Map
--------

    61616 JMS
    8161  UI
    5672  AMQP  (since `astraube/activemq:5.12.1`)
    61613 STOMP (since `astraube/activemq:5.12.1`)
    1883  MQTT  (since `astraube/activemq:5.12.1`)
    61614 WS    (since `astraube/activemq:5.12.1`)

Customizing configuration and persistence location
--------------------------------------------------
By default data and configuration is stored inside the container and will be
lost after the container has been shut down and removed. To persist these
files you can mount these directories to directories on your host system:

    docker run -p 61616:61616 -p 8161:8161 \
               -v /your/persistent/dir/conf:/opt/activemq/conf \
               -v /your/persistent/dir/data:/opt/activemq/data \
               astraube/activemq

ActiveMQ expects that some configuration files already exists, so they won't be
created automatically, instead you have to create them on your own before
starting the container. If you want to start with the default configuration you
can initialize your directories using some intermediate container:

    docker run --user root --rm -ti \
      -v /your/persistent/dir/conf:/mnt/conf \
      -v /your/persistent/dir/data:/mnt/data \
      astraube/activemq:5.15.4-alpine /bin/sh

This will bring up a shell, so you can just execute the following commands
inside this intermediate container to copy the default configuration to your
host directory:

    chown activemq:activemq /mnt/conf
    chown activemq:activemq /mnt/data
    cp -a /opt/activemq/conf/* /mnt/conf/
    cp -a /opt/activemq/data/* /mnt/data/
    exit

The last command will stop and remove the intermediate container. Your
directories are now initialized and you can run ActiveMQ as described above.
