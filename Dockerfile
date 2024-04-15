FROM centos:latest

RUN yum update
RUN yum clean all

RUN yum install -y python3 
RUN yum install -y python3-pip 
RUN yum  install fontconfig openjdk-17-jre 
RUN yum install git
RUN yum update
