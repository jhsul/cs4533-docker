FROM ubuntu:22.04

RUN apt update && apt -y install locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

RUN apt install --no-install-recommends -y \
git \
openjdk-18-jdk \
build-essential \
pkg-config \
uuid-dev \
make \
cmake \
clang \
zlib1g-dev 

RUN apt-get install -y llvm

# Set container to use clang and clang++ instead of gcc
ENV CC clang
ENV CXX clang++

# Bad practice but fixes build issue that requires git
RUN git config --global http.sslVerify false


COPY antlr /home/antlr

WORKDIR /home/antlr

RUN cmake -S . -B build
RUN cmake --build build

WORKDIR /home/antlr/build

RUN ctest

WORKDIR /home/antlr

RUN cp ./dist/libantlr4-runtime.a /home/

WORKDIR /home

CMD sh -c "/bin/bash"