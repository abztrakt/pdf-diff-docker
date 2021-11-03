FROM ubuntu:bionic

RUN apt-get update -y

RUN apt-get install -y python3-lxml poppler-utils python sudo \
                       python3-setuptools ca-certificates gcc g++ python3-dev \
                       git zlib1g-dev libjpeg-dev

ARG USER_ID=1000
RUN useradd --shell /bin/bash -u $USER_ID -o -c "" -m build

RUN echo "\nbuild ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers

USER build
WORKDIR /home/build
RUN git clone https://github.com/JoshData/pdf-diff
RUN cd pdf-diff && sudo python3 setup.py install

CMD pdf-diff /home/build/files/$OLDEST /home/build/files/$NEWEST > /home/build/files/$OUTPUT
