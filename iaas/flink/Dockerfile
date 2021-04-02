FROM flink:1.11.1-scala_2.12

RUN mkdir -p /opt/flink/usrlib
RUN wget -q https://group-bison.oss-cn-beijing.aliyuncs.com/WordCount.jar -O /opt/flink/usrlib/WordCount.jar

RUN sed -i 's/taskmanager.numberOfTaskSlots: 1/taskmanager.numberOfTaskSlots: 10/g' /opt/flink/conf/flink-conf.yaml

VOLUME ["/opt/flink/log", "/opt/flink/data"]

CMD ["standalone-job"]

