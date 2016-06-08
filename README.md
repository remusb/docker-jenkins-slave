mbentley/jenkins-slave
======================

docker image for jenkins slaves

To pull this image:
`docker pull mbentley/jenkins-slave`

Example usage:

```
docker run -d --name jenkins-slave \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v jenkins-slave:/data \
  mbentley/jenkins-slave \
  http://jenkins.example.com:8080/computer/nodename/slave-agent.jnlp
```
