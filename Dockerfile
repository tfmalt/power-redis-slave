FROM ubuntu:latest
MAINTAINER Thomas Malt  <thomas@malt.no>

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y redis-server
RUN apt-get install -y stunnel4
RUN apt-get install -y supervisor

RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD redis.conf /etc/redis/redis.conf
ADD stunnel/redis-client.conf /etc/stunnel/redis-client.conf
ADD stunnel-default /etc/default/stunnel4

EXPOSE 6379

CMD ["/usr/bin/supervisord"]

