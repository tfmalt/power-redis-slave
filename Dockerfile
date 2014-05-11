FROM ubuntu:latest
MAINTAINER Thomas Malt  <thomas@malt.no>

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y redis-server

# ADD . /src
ADD redis.conf /etc/redis/redis.conf

EXPOSE 6379
ENTRYPOINT ["/usr/bin/redis-server"]

