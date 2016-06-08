#!/bin/sh

set -e

PROTOCOL="${PROTOCOL:-http}"
JENKINS_MASTER="${1}"
SLAVE_NAME="${2}"

# check to see if jenkins master was specified
if [ -z "${JENKINS_MASTER}" ]
then
  echo "Please specify a Jenkins Master as your first parameter"
  echo "Usage: $0 jenkins.example.com:8080 slave1"
  exit 1
fi

# check and see if slave name was provided
if [ -z "${SLAVE_NAME}" ]
then
  echo "Please specify a Jenkins Slave name your second parameter"
  echo "Usage: $0 jenkins.example.com:8080 slave1"
  exit 1
fi

# download slave.jar if necessary
if [ ! -f "/slave.jar" ]
then
  wget ${PROTOCOL}://${JENKINS_MASTER}/jnlpJars/slave.jar -O /slave.jar
fi

# start the jenkins slave
exec java -jar /slave.jar -jnlpUrl ${PROTOCOL}://${JENKINS_MASTER}/computer/${SLAVE_NAME}/slave-agent.jnlp
