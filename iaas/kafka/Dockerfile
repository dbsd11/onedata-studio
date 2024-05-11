FROM gwilym/wurstmeister-kafka-docker # adrianmontagu/wurstmeister-kafka:latest for arm64

ENV ZOOKEEPER_VERSION 3.7.2

#Download Zookeeper
RUN wget -q https://downloads.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz -O zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
wget -q https://downloads.apache.org/zookeeper/KEYS && \
wget -q https://downloads.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc -O zookeeper-${ZOOKEEPER_VERSION}.tar.gz.asc && \
wget -q https://downloads.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512 -O zookeeper-${ZOOKEEPER_VERSION}.tar.gz.sha512

#Verify download
#RUN sha512sum -c zookeeper-${ZOOKEEPER_VERSION}.tar.gz.sha512 && \
#gpg --import KEYS && \
#gpg --verify zookeeper-${ZOOKEEPER_VERSION}.tar.gz.asc

#Install
RUN tar -xzf zookeeper-${ZOOKEEPER_VERSION}.tar.gz -C /opt && mv /opt/apache-zookeeper* /opt/zookeeper-${ZOOKEEPER_VERSION}

#Configure
RUN mv /opt/zookeeper-${ZOOKEEPER_VERSION}/conf/zoo_sample.cfg /opt/zookeeper-${ZOOKEEPER_VERSION}/conf/zoo.cfg

#ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV ZK_HOME /opt/zookeeper-${ZOOKEEPER_VERSION}
RUN sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh 
ADD start-kafka.sh /usr/bin/start-kafka.sh
EXPOSE 2181 2888 3888 9092

VOLUME ["/opt/zookeeper-${ZOOKEEPER_VERSION}/conf", "/opt/zookeeper-${ZOOKEEPER_VERSION}/data", "/opt/kafka/kafka-logs"]

CMD bash /usr/bin/start-zk.sh || bash /usr/bin/start-kafka.sh
