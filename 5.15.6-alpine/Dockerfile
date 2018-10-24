
FROM alpine:3.8 as downloader

ENV ACTIVEMQ_VERSION 5.15.6
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION
#ENV ACTIVEMQ_TCP=61616 ACTIVEMQ_AMQP=5672 ACTIVEMQ_STOMP=61613 ACTIVEMQ_MQTT=1883 ACTIVEMQ_WS=61614 ACTIVEMQ_UI=8161
#ENV SHA512_VAL=a1b931a25c513f83f4f712cc126ee67a2b196ea23a243aa6cafe357ea03f721fba6cb566701e5c0e1f2f7ad8954807361364635c45d5069ec2dbf0ba5c6b588b
#ENV ACTIVEMQ_HOME /opt/activemq

WORKDIR /tmp

RUN \
  apk --update add curl

RUN \
  curl \
    --silent \
    --output /tmp/$ACTIVEMQ-bin.tar.gz \
    https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ-bin.tar.gz

RUN \
  curl \
    --silent \
    --output /tmp/$ACTIVEMQ-bin.tar.gz.sha512 \
    https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ-bin.tar.gz.sha512

RUN \
  set -e && \
  sha512sum -c /tmp/$ACTIVEMQ-bin.tar.gz.sha512

# -----------------------------------------------------------------------------------------

FROM openjdk:8-jre-alpine

ENV \
  ACTIVEMQ_VERSION=5.15.6 \
  ACTIVEMQ_HOME=/opt/activemq \
  ACTIVEMQ_TCP=61616 \
  ACTIVEMQ_AMQP=5672 \
  ACTIVEMQ_STOMP=61613 \
  ACTIVEMQ_MQTT=1883 \
  ACTIVEMQ_WS=61614 \
  ACTIVEMQ_UI=8161

COPY --from=downloader /tmp/apache-activemq-$ACTIVEMQ_VERSION-bin.tar.gz  /tmp/

RUN \
  apk update  --quiet && \
  apk upgrade --quiet && \
  apk add     --quiet \
    shadow && \
  mkdir /opt && \
  tar xzf /tmp/apache-activemq-$ACTIVEMQ_VERSION-bin.tar.gz -C /opt && \
  ln -s /opt/$ACTIVEMQ $ACTIVEMQ_HOME && \
  addgroup -S activemq && adduser -S -H -G activemq -h $ACTIVEMQ_HOME activemq && \
  chown -R activemq:activemq /opt/$ACTIVEMQ && \
  chown -h activemq:activemq $ACTIVEMQ_HOME && \
  rm -rf \
    /tmp/* \
    /var/cache/apk/*

USER activemq

WORKDIR $ACTIVEMQ_HOME
EXPOSE $ACTIVEMQ_TCP $ACTIVEMQ_AMQP $ACTIVEMQ_STOMP $ACTIVEMQ_MQTT $ACTIVEMQ_WS $ACTIVEMQ_UI

CMD ["/bin/sh", "-c", "bin/activemq console"]

#RUN tar xzf $ACTIVEMQ-bin.tar.gz -C  /opt && \
#    ln -s /opt/$ACTIVEMQ $ACTIVEMQ_HOME && \
#    addgroup -S activemq && adduser -S -H -G activemq -h $ACTIVEMQ_HOME activemq && \
#    chown -R activemq:activemq /opt/$ACTIVEMQ && \
#    chown -h activemq:activemq $ACTIVEMQ_HOME && \
#    apk del build-dependencies && \
#    rm -rf /var/cache/apk/*
#
#USER activemq
#
#WORKDIR $ACTIVEMQ_HOME
#EXPOSE $ACTIVEMQ_TCP $ACTIVEMQ_AMQP $ACTIVEMQ_STOMP $ACTIVEMQ_MQTT $ACTIVEMQ_WS $ACTIVEMQ_UI
#
#CMD ["/bin/sh", "-c", "bin/activemq console"]
#
