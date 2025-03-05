FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    g++ \
    cmake

COPY ./usr/fibonacci /usr/local/bin/fibonacci

RUN chmod +x /usr/local/bin/fibonacci

WORKDIR /usr/local/bin

CMD ["fibonacci"]
