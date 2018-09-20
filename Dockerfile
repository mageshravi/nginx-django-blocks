FROM ubuntu:18.04

RUN apt update; \
    apt install --yes postgresql postgresql-contrib; \
    apt install --yes nginx; \
    service nginx start; \
    apt install --yes python3-pip; \
    pip3 install virtualenv;

RUN useradd -m -d /home/webinative -s /bin/bash webinative;

