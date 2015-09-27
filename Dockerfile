#start a centos-mysql image
From centos:6
MAINTAINER "lvqiang" <lv.rainbow.free@gmail.com>
ENV container docker

#install
RUN yum install -y vim-enhanced.x86_64 
RUN yum install -y sudo.x86_64

RUN mkdir /usr/local/mysql

#install percona5.6
RUN yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm
RUN yum install -y Percona-Server-server-56

ADD my.cnf /etc/my.cnf


RUN chown -Rf mysql.mysql /usr/local/mysql

USER mysql
RUN mysql_install_db

#RUN /usr/sbin/mysqld &

USER root

#export mysql port
EXPOSE 3306
