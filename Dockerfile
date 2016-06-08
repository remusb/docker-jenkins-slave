FROM java:8-jre-alpine

COPY slave.jar /slave.jar

ENTRYPOINT ["java","-jar","/slave.jar","-jnlpUrl"]
