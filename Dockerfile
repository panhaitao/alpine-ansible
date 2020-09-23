FROM alpine:latest
MAINTAINER shenlan xz@onwalk.net

ENV ROOT_PW=admin
ADD set_root_pw.sh /
RUN /set_root_pw.sh $ROOT_PW

ADD repositories /etc/apk/repositories 
RUN apk --update add nginx git ansible openssh sshpass curl openjdk11-jre

ENV JAVA_HOME="/usr/lib/jvm/default-jvm/"
ENV PATH=$PATH:${JAVA_HOME}/bin
RUN cd /tmp && wget http://mirrors.ustc.edu.cn/apache/jmeter/binaries/apache-jmeter-5.3.tgz && tar -xvpf apache-jmeter-5.3.tgz -C /home/ 

RUN rm -rf /var/cache/apk/*
RUN rm -rvf /tmp/*.tgz

COPY default.conf /etc/nginx/conf.d/default.conf
COPY sshd_config /etc/ssh/sshd_config 
COPY docker-entrypoint.sh /

VOLUME ['/var/www/']  
EXPOSE 22 80

ENTRYPOINT ["/docker-entrypoint.sh"]
