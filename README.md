docker-dnsmasq
==============

Docker container to run dnsmasq using pipework to bridge to the target network for DHCP, DNS and TFTP services.  DHCP in particular needs to be bridged (as opposed to port forwarded) so that it can receive and send broadcast packets.

Build
-----

    $ docker build -t dnsmasq .

Run
---

Create a docker container with the specified dnsmasq arguments and start in daemon mode.  Then start [pipework](https://github.com/jpetazzo/pipework) to bridge the running container to the desired network.  In this example eth2 is assumed to be an interface on the host docker host machine functioning as a router with IP 10.1.2.1/24.

    $ docker run --daemon --name dnsmasq10 dnsmasq --dhcp-range=10.1.2.100,10.1.2.200,255.255.255.0 --dhcp-option=option:router,10.1.2.1
    $ pipework eth2 dnsmasq10 10.1.2.2/24

Todo
----

* Find an better way to restart containers without the need for a script that runs pipework after starting the container.  For now, watch upstream pipework repo for a solution. :)
