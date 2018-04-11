FROM openjdk:8-jre

ENV ACTIVEMQ_VERSION 5.14.5
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION
ENV ACTIVEMQ_TCP=61616 ACTIVEMQ_AMQP=5672 ACTIVEMQ_STOMP=61613 ACTIVEMQ_MQTT=1883 ACTIVEMQ_WS=61614 ACTIVEMQ_UI=8161

ENV ACTIVEMQ_HOME /app/apache-activemq-5.14.5

WORKDIR /app

RUN set -x && \
    curl -s -S https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ-bin.tar.gz | tar xvz -C /app 

RUN chgrp -R 0 /app && \
    chmod -R g=u /app

EXPOSE $ACTIVEMQ_TCP $ACTIVEMQ_AMQP $ACTIVEMQ_STOMP $ACTIVEMQ_MQTT $ACTIVEMQ_WS $ACTIVEMQ_UI

CMD ["/bin/sh", "-c", "echo 'hello kambiz'; pwd; ls -al; cd apache-activemq-5.14.5/bin; ls -al; ./activemq console  "]
