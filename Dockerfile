FROM ubuntu:20.04

RUN apt-get -y update

RUN apt clean

RUN apt install -y python3 
RUN apt install python-pip -y
 
RUN apt install git -y
RUN apt update -y
