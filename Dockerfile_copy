FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    dpkg \
    && rm -rf /var/lib/apt/lists/*

COPY fibonacci.deb /tmp/

RUN dpkg -i /tmp/fibonacci.deb || apt-get -fy install

WORKDIR /usr/local/bin

CMD ["fibonacci", "10"]
