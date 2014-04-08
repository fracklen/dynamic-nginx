FROM ubuntu:13.10
MAINTAINER Martin Neiiendam "mn@lokalebasen.dk"
ENV REFRESHED_AT 2014-04-08

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install nginx-full curl jq openssh-server supervisor

# Setup supervisor
RUN mkdir -p /var/log/supervisor

# Setup nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir -p /etc/nginx/site-includes
RUN rm /etc/nginx/sites-enabled/default

# Setup sshd
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN echo 'root:dynamic' |chpasswd

EXPOSE 80
EXPOSE 22

ADD . /usr/local/bin/
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV OUTPUT /var/log/dynamic-nginx.log

CMD ["/usr/bin/supervisord"]
