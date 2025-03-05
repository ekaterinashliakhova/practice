FROM ubuntu:latest

COPY . /laba3

WORKDIR /laba3

RUN apt-get update

RUN apt-get install -y make debhelper dpkg-dev libgtest-dev

RUN dpkg -i /laba3/fibonacci.deb

CMD [ "test_fibonacci" ]
