FROM openjdk:8u265


ENV DRUID_IO_VERSION=0.20.2

RUN wget -q https://mirrors.tuna.tsinghua.edu.cn/apache/druid/${DRUID_IO_VERSION}/apache-druid-${DRUID_IO_VERSION}-bin.tar.gz \
    && tar -xzf apache-druid-${DRUID_IO_VERSION}-bin.tar.gz -C /opt/

EXPOSE 8888

VOLUME ["/opt/apache-druid-${DRUID_IO_VERSION}/var"]

WORKDIR /opt/apache-druid-${DRUID_IO_VERSION}

CMD bin/start-nano-quickstart
