#!/bin/sh

set -e

PROTOCOL="${PROTOCOL:-http}"

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

# check and see if secret was provided
if [ -z "${SECRET}" ]
then
  # null value for SECRET_OPT as no secret was provided
  SECRET_OPT=""
else
  # set the SECRET_OPT env var with the secret provided
  SECRET_OPT="-secret ${SECRET}"
fi

CREDS_OPT=""
if [ -n "${USER_ID}" ]; then
  CREDS_OPT="-jnlpCredentials ${USER_ID}:${USER_TOKEN}"
fi

# download slave.jar if necessary
if [ ! -f "/slave.jar" ]
then
  wget ${PROTOCOL}://${JENKINS_MASTER}/jnlpJars/slave.jar -O /slave.jar
fi

if [ -n "${GIT_USER}" ]; then
  git config --global user.name "${GIT_USER}"
fi

if [ -n "${GIT_EMAIL}" ]; then
  git config --global user.email "${GIT_EMAIL}"
fi

# start the jenkins slave
exec java -jar /slave.jar -jnlpUrl ${PROTOCOL}://${JENKINS_MASTER}/computer/${SLAVE_NAME}/slave-agent.jnlp ${SECRET_OPT} ${CREDS_OPT}
