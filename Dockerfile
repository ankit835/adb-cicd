FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y
RUN yum clean all

RUN yum install -y python3 
RUN yum -y install epel-release && yum clean all
RUN dnf -y install python-pip  
RUN yum install git -y
RUN yum update -y
