FROM ubuntu:20.04

RUN apt-get update && apt-get -y upgrade
RUN DEBIAN_FRONTEND="noninteractive" &&  apt-get install tzdata
RUN apt-get install -y git  wget nano

RUN wget https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz 
RUN tar -xvf go1.16.4.linux-amd64.tar.gz   
RUN mv go /root/

ENV GOROOT=/root/go/
ENV GOPATH=/go
ENV PATH=$PATH:/root/go/bin:$GOPATH/bin

RUN go version

RUN git clone -b v0.4.0 https://github.com/yggdrasil-network/yggdrasil-go
RUN go version
RUN go get golang.org/x/mobile/cmd/gomobile golang.org/x/mobile/cmd/gobind
RUN apt-get install -y android-sdk
RUN cd /usr/lib/android-sdk && wget https://dl.google.com/android/repository/android-ndk-r20b-linux-x86_64.zip && unzip android-ndk-*-linux-x86_64.zip &&  ln -s android-ndk-r20b ndk-bundle
ENV ANDROID_HOME=/usr/lib/android-sdk/
ENV GO111MODULE=off
RUN go get golang.org/x/mobile/cmd/gobind
RUN go get golang.org/x/mobile/cmd/gomobile
RUN gomobile init

RUN go get github.com/yggdrasil-network/yggdrasil-extras/src/mobile || true
RUN cd /go/src/github.com/yggdrasil-network/yggdrasil-extras && git checkout future
RUN cd /yggdrasil-go && ./build -a 

