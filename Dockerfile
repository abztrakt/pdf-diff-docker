FROM ubuntu:bionic

RUN apt-get update -y

RUN apt-get install -y python3-lxml poppler-utils
RUN apt-get install -y python sudo python3-setuptools
RUN apt-get install -y ca-certificates gcc g++ python3-dev

ARG USER_ID=1000
RUN useradd --shell /bin/bash -u $USER_ID -o -c "" -m build

RUN echo "\nbuild ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers

USER build
RUN mkdir -p /home/build/differ

WORKDIR /home/build
