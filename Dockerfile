# pull ubuntu developer image
FROM ubuntu:devel

# set shell to bash, fail safe for pipe outputs to shell
SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

# upgrade machine
RUN apt-get upgrade && apt-get update 

# install node and npm
RUN apt-get -y install nodejs npm

# create and set workdir
WORKDIR /discord

# current dir to workdir
COPY . .

# install packages in workdir
RUN npm install 
