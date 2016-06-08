FROM java:8-jre-alpine

COPY slave.jar /slave.jar

RUN apk add --no-cache wget git
RUN wget -O /usr/local/bin/docker "https://packages.docker.com/1.11/builds/linux/amd64/docker-1.11.2-cs3" &&\
  chmod +x /usr/local/bin/docker

ENTRYPOINT ["java","-jar","/slave.jar","-jnlpUrl"]
