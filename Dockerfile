FROM ubuntu

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
    
RUN add-apt-repository ppa:m-grant-prg/utils

RUN apt install -y get-iplayer

