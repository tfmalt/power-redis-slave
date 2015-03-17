FROM ubuntu:latest
MAINTAINER Thomas Malt  <thomas@malt.no>

RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    redis-server stunnel4 supervisor python-pip 
RUN pip install supervisor-stdout

RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisord.conf
ADD redis.conf /etc/redis/redis.conf
ADD stunnel/redis-client.conf /etc/stunnel/redis-client.conf
ADD stunnel/private.pem /etc/stunnel/private.pem

EXPOSE 6379 6380

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

