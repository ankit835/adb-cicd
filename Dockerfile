FROM ubuntu:latest

RUN apt update && \
    apt install -y python3 && \
    apt install -y python3-pip && \
    apt  install fontconfig openjdk-17-jre && \
    apt install git && \
    apt update
