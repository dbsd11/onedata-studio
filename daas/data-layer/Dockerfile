FROM registry.cn-huhehaote.aliyuncs.com/bison/data-layer:1.0.0-SNAPSHOT

RUN mkdir /opt/data-layer \
    && wget -q https://group-bison.oss-cn-beijing.aliyuncs.com/onedata-studio/soul-admin.jar -O /opt/data-layer/soul-admin.jar \
    && wget -q https://group-bison.oss-cn-beijing.aliyuncs.com/onedata-studio/start-soul-admin.sh -O /opt/data-layer/start-soul-admin.sh

EXPOSE 50000 9528

VOLUME ["/opt/daya-layer/soul-admin"]

WORKDIR /opt/data-layer

ENTRYPOINT sh start-soul-admin.sh && java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar /data-layer.jar
