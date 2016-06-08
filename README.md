mbentley/jenkins-slave
======================

docker image for jenkins slaves

To pull this image:
`docker pull mbentley/jenkins-slave`

Example usage:

`docker run -d --name jenkins-slave mbentley/jenkins-slave http://jenkins.example.com:8080/computer/localdev/slave-agent.jnlp`
