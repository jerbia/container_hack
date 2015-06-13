# Container Hack Demo
This project shows how you can get root access into Docker host using a simple container, which gets access to the Docker UNIX socket (/var/run/docker.sock). 

The trick is done by running a super-privileged container (thanks to the access to the Docker socket)
and getting access to the host using nsenter.

A Docker image that demonstrates this 'hack' is also available on Docker Hub.
Try it out by running:

```docker run -v /var/run/docker.sock:/var/run/docker.sock jerbi/docker_cli```

Outcome is that a user called "hacked" is created on your host....

