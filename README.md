Docker nat-router
=================

Docker container that functions as a simple NAT router.  Linux iptables MASQUERADE provides network address translation (NAT) and dnsmasq provides DHCP, DNS, and TFP services.

The container is bridged to the local area network using pipework to create eth1.  The container needs privileged for some ioctl() calls in dnsmasq (SIOCSARP in particular needs NET_ADIN) as well as to do anything in iptables.

Build
-----

    $ docker build -t dnsmasq .

Run
---

Create a docker container with the specified dnsmasq arguments and start in daemon mode.  Then start [pipework](https://github.com/jpetazzo/pipework) to bridge the running container to the desired network.  Running the container privileged enables it to also perform NAT routing / masquerade.

    $ docker run --privileged --daemon --name dnsmasq10 dnsmasq --dhcp-range=10.1.2.100,10.1.2.200,255.255.255.0
    $ pipework eth2 dnsmasq10 10.1.2.2/24

Todo
----

* Find an better way to restart containers without the need for a script that runs pipework after starting the container.  For now, watch upstream pipework repo for a solution. :)
