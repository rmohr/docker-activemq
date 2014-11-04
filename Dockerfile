FROM dockerfile/java:oracle-java7

ENV ACTIVEMQ_VERSION 5.10.0
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION

RUN \
    curl -O http://mirror2.klaus-uwe.me/apache/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ-bin.tar.gz && \
    mkdir -p /opt && \
    tar xf $ACTIVEMQ-bin.tar.gz -C /opt/ && \
    rm $ACTIVEMQ-bin.tar.gz && \
    ln -s /opt/$ACTIVEMQ /opt/activemq

WORKDIR /opt/activemq
EXPOSE 61616 8161

CMD ["/bin/bash", "-c", "bin/activemq console"]
