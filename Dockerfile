FROM ubuntu:18.04

RUN apt update; \
    apt install --yes postgresql postgresql-contrib; \
    apt install --yes nginx; \
    service nginx start; \
    apt install --yes python3-pip; \
    pip3 install virtualenv;

# create new user 'webinative'
# add user to nginx group 'www-data' (necessary for uwsgi socket)
RUN useradd -m -d /home/webinative -s /bin/bash webinative; \
    usermod -a -G www-data webinative;
