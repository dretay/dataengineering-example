FROM ubuntu:22.04

# update apt-get
RUN apt-get update -y && apt-get upgrade -y

#install deps
RUN apt-get install python3-pip build-essential git -y

COPY requirements.txt .
RUN pip3 install -r requirements.txt

WORKDIR /workspace