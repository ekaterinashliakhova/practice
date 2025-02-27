FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y \
    wget \
    dpkg-dev \
    && rm -rf /var/lib/apt/lists/*

COPY fibonacci.deb /tmp/

RUN dpkg -i /tmp/fibonacci.deb || apt-get -fy install

COPY usr/test_fibonacci /usr/local/bin/test_fibonacci

WORKDIR /app

CMD ["test_fibonacci"]
