# Pull lean base image.
FROM debian:jessie

MAINTAINER Kyle Manna <kmanna@fanhattan.com>

RUN apt-get update && apt-get install -y dnsmasq iptables

# Install helpers
ADD https://raw.githubusercontent.com/jpetazzo/pipework/master/pipework /usr/bin/
ADD wrapper /usr/bin/

RUN chmod a+x /usr/bin/pipework /usr/bin/wrapper

# Wrapper helps with pipework
ENTRYPOINT ["wrapper"]

# Default dnsmasq argument is --help which is passed after pipwork wait
CMD ["--help"]
