FROM java:8

ENV DEBIAN_FRONTEND noninteractive

RUN wget -nv https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.148/presto-server-0.148.tar.gz -O /tmp/presto.tar.gz && \
  mkdir /opt/presto && \
  tar -zxvf /tmp/presto.tar.gz -C /opt/presto --strip-components=1 && \
  rm /tmp/presto.tar.gz

COPY config/* /opt/presto/etc/

EXPOSE 8080

ENTRYPOINT ["/opt/presto/bin/launcher", "run"]
