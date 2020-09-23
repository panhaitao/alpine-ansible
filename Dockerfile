FROM alpine:latest
MAINTAINER shenlan xz@onwalk.net
ADD  repositories /etc/apk/repositories 
RUN  apk --update add nginx git ansible openssh sshpass curl

COPY default.conf /etc/nginx/conf.d/default.conf
COPY sshd_config /etc/ssh/sshd_config 
COPY docker-entrypoint.sh /

VOLUME ['/var/www/']  
EXPOSE 22 80

ENTRYPOINT ["/docker-entrypoint.sh"]
