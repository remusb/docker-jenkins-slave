FROM ubuntu:xenial
MAINTAINER remus@bunduc.ro

ENV JENKINS_HOME="/var/lib/jenkins"
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN apt-get -q update
RUN apt-get install -y --no-install-recommends wget git jq python-pip make openjdk-8-jre-headless openssh-client curl bc
RUN pip install virtualenv
RUN mkdir -p /var/lib/jenkins
RUN virtualenv /var/lib/jenkins/ethos

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
