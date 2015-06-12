FROM progrium/busybox
ADD docker /usr/bin/
ADD hack.sh /
CMD ./hack.sh
