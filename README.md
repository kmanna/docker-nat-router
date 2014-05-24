Docker nat-router
=================

Docker container that functions as a simple NAT router.  Linux iptables provides network address translation (NAT) and dnsmasq provides DHCP, DNS, and TFTP services.

The container is bridged to the local area network using pipework to create eth1.  The container needs privileged for some ioctl() calls in dnsmasq (SIOCSARP in particular needs NET_ADMIN) as well as to do anything in iptables.

Build
-----

    $ docker build -t nat-router .

Run
---

Create a docker container with the specified dnsmasq arguments and start in daemon mode.  Run [pipework](https://github.com/jpetazzo/pipework) to bridge the running container to the desired network.

    $ docker run --privileged --detach --name nat-router-eth2 nat-router --dhcp-range=10.1.2.100,10.1.2.200,255.255.255.0
    $ pipework eth2 nat-router-eth2 10.1.2.1/24

Todo
----

* Find an better way to restart containers without the need for a script that runs pipework after starting the container.  For now, watch upstream pipework repo for a solution. :)
