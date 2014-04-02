FROM ubuntu:13.10
MAINTAINER Martin Neiiendam "mn@lokalebasen.dk"

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install nginx-full curl jq

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir -p /etc/nginx/site-includes
RUN rm /etc/nginx/sites-enabled/default

EXPOSE 80

ADD . /usr/local/bin/

ENV ETCD_URL http://172.16.42.43:5001
ENV OUTPUT /dev/null

CMD ["/usr/local/bin/start-dynamic-nginx.sh"]
