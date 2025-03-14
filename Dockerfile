FROM ubuntu:latest

COPY . /laba3

WORKDIR /laba3

RUN apt-get update && apt-get install -y make debhelper dpkg-dev libgtest-dev

RUN make all 

RUN dpkg -i /laba3/fibonacci.deb

CMD [ "/laba3/usr/test_fibonacci" ]