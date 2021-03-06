FROM ubuntu:14.04.1

RUN apt-get update -qq && apt-get install -y \
git \
vim-nox \
gawk \
graphviz \
id-utils \
exuberant-ctags \
cscope \
wget

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

WORKDIR /root
RUN git clone https://github.com/exvim/main.git
WORKDIR /root/main

RUN sh unix/install.sh
RUN sh unix/update-plugins.sh
RUN sh unix/replace-my-vim.sh

RUN mkdir /work

