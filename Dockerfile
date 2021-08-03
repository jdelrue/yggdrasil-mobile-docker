FROM ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" &&  apt-get install tzdata
RUN apt-get install -y git golang wget nano

RUN git clone https://github.com/yggdrasil-network/yggdrasil-go
RUN go version
RUN go get golang.org/x/mobile/cmd/gomobile golang.org/x/mobile/cmd/gobind
ENV GOPATH=/go
ENV PATH=$PATH:/root/go/bin:$GOPATH/bin
RUN apt-get install -y android-sdk
RUN cd /usr/lib/android-sdk && wget https://dl.google.com/android/repository/android-ndk-r20b-linux-x86_64.zip && unzip android-ndk-*-linux-x86_64.zip &&  ln -s android-ndk-r20b ndk-bundle
ENV ANDROID_HOME=/usr/lib/android-sdk/
ENV GO111MODULE=off
RUN go get golang.org/x/mobile/cmd/gobind
RUN go get golang.org/x/mobile/cmd/gomobile
RUN gomobile init

#RUN wget https://dl.google.com/android/repository/android-ndk-r20b-linux-x86_64.zip
#RUN cd yggdrasil-go && ./build -a 

