FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install curl unzip sudo qemu-user-static binfmt-support libc6 libcrypt1 -y

WORKDIR /bedrock

RUN curl -o bedrock-server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.18.12.01.zip
RUN unzip -o bedrock-server.zip

RUN curl -H "Accept-Encoding: identity" -L -o depends.zip https://raw.githubusercontent.com/TheRemote/MinecraftBedrockServer/master/depends.zip
RUN unzip depends.zip
RUN mkdir /lib64
RUN rm -rf /lib64/ld-linux-x86-64.so.2
RUN ln -s /bedrock/ld-2.31.so /lib64/ld-linux-x86-64.so.2

COPY ./startup.sh .
RUN chmod a+x ./startup.sh

COPY root/ /

VOLUME /config
