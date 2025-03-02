FROM ubuntu:latest

RUN apt-get update && apt-get install -y make

COPY ./path/to/fibonacci /usr/local/bin/fibonacci

ENTRYPOINT ["fibonacci"]
