FROM ubuntu:latest

COPY . /practice_3

WORKDIR /practice_3

RUN apt-get update
RUN apt-get install -y make debhelper dpkg-dev libgtest-dev

RUN dpkg -i /practice_3/fibonacci.deb

CMD [ "/usr/bin/fibonacci" ]
