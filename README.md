# Docker Host Takeover Demo
This project shows how you can get root access into Docker host using a regular container. This is possible thanks to Docker UNIX socket (/var/run/docker.sock), which should be volume mounted to the regular container.

How this is done? Well the trick is that the regular container, which has access to Docker UNIX Socket, simply spawns a super-privileged container. This super-privileged container uses 'nsenter' to enter the Host namespace and run a command as root.

## Instructions
Create an image from the Dockerfile:
```docker build -t demo_hack .```

Run the image while providing access to Docker UNIX socket:
```docker run -v /var/run/docker.sock:/var/run/docker.sock demo_hack```

You will notice that the container created a user 'hacked' on your host...
You can play around with hack.sh to change the command line being invoked on your host.
Repackage the image and run it again.

## Docker Hub Demo 
A Docker image that demonstrates this 'hack' is also available on Docker Hub.
Try it out by running:

```docker run -v /var/run/docker.sock:/var/run/docker.sock jerbi/docker_cli```

Outcome is that a user called 'hacked' is created on your host....

