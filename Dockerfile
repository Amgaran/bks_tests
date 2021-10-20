# syntax=docker/dockerfile:1
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && rm -rf /var/lib/apt/lists/* \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip --no-cache-dir

ENV PYTHONUNBUFFERED=1
ENV TIMEOUT=120

RUN apt-get update \
  && apt-get install -y libomp5 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt --no-cache-dir
COPY . /code/
