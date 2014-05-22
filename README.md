docker-dnsmasq
==============

Minimal Docker container to run dnsmasq.

Build
-----

    $ docker build -t dnsmasq .

Run
---

Create a docker container with the specified dnsmasq arguments and start in daemon mode.  Then start [pipework](https://github.com/jpetazzo/pipework) to bridge the running container to the desired network.

    $ docker run --daemon --name dnsmasq10 --dhcp-range=10.1.2.100,10.1.2.200,255.255.255.0 --dhcp-option=option:router,10.1.2.1
    $ pipework eth2 dnsmasq10 10.1.2.2/24

Todo
----

* Find an easier way to restart containers without having to write a script that runs pipework after it.  Watch upstream pipework repo. :)
