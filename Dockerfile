FROM ubuntu:trusty
MAINTAINER Stefan Lau <github@stefanlau.com>

RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

RUN echo 'deb http://deb.torproject.org/torproject.org trusty main' >> /etc/apt/sources.list.d/tor.list

RUN apt-get update
RUN apt-get install -y tor

RUN echo 'ExitPolicy reject *:*' >> /etc/tor/torrc
RUN usermod -u 9001 debian-tor
RUN groupmod -g 9001 debian-tor
RUN chown -R debian-tor:debian-tor /var/lib/tor
USER debian-tor

EXPOSE 9001
EXPOSE 9030

VOLUME /var/lib/tor

CMD ["/usr/sbin/tor"]
