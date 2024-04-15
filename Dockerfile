FROM ubuntu:latest

RUN apt-get update \
    && apt-get clean

RUN apt-get install -y python3 
RUN apt install -y python3-pip 
RUN apt  install fontconfig openjdk-17-jre 
RUN apt install git
RUN apt-get update
