FROM alpine:3.8 as downloader

ENV ACTIVEMQ_VERSION 5.15.6
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION

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
  export ACTIVEMQ=apache-activemq-${ACTIVEMQ_VERSION} && \
  apk update  --quiet --no-cache && \
  apk upgrade --quiet --no-cache && \
  apk add     --quiet --no-cache --virtual .build-deps \
    shadow && \
  mkdir /opt && \
  tar xzf /tmp/${ACTIVEMQ}-bin.tar.gz -C /opt && \
  ln -s /opt/${ACTIVEMQ} ${ACTIVEMQ_HOME}  && \
  addgroup -S activemq && \
  adduser -S -H -G activemq -h ${ACTIVEMQ_HOME} activemq && \
  chown -R activemq:activemq /opt/${ACTIVEMQ} && \
  chown -h activemq:activemq ${ACTIVEMQ_HOME} && \
  apk del --quiet .build-deps && \
  rm -rf \
    /tmp/* \
    /var/cache/apk/*

USER activemq

WORKDIR ${ACTIVEMQ_HOME}
EXPOSE \
  ${ACTIVEMQ_TCP} \
  ${ACTIVEMQ_AMQP} \
  ${ACTIVEMQ_STOMP} \
  ${ACTIVEMQ_MQTT} \
  ${ACTIVEMQ_WS} \
  ${ACTIVEMQ_UI}

VOLUME [ "/opt/activemq/conf", "/opt/activemq/data" ]

CMD ["/bin/sh", "-c", "bin/activemq console"]
