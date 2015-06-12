# Container Hack Demo
This project shows how a simple container, that gets access to Docker UNIX socket, 
can obtain root access to the host.

The trick is done by running a super-privileged container (thanks to the access to the Docker socket)
and getting access to the host using nsenter from it.

