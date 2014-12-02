##
# CentOS 7 plus SFTP
##
FROM centos:centos7
MAINTAINER Dawid Malinowski <dawidmalina@gmail.com>

# some env
ENV REFRESHED_AT 2014-11-06

# install SSH
RUN yum -y install openssh-server && \
    yum clean all

# sshd needs this directory to run
RUN mkdir -p /var/run/sshd

# add configuration and script
ADD . /root
WORKDIR /root
RUN mv sshd_config /etc/ssh/sshd_config && \
    chmod +x run

EXPOSE 22

ENTRYPOINT ["./run"]
