FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y
RUN yum clean all

RUN yum install -y python3 
RUN yum install -y python3-pip 
RUN yum  install fontconfig openjdk-17-jre 
RUN yum install git
RUN yum update
