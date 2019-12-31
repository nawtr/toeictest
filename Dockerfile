FROM node:lts

RUN apt-get update
RUN apt-get install -y vim mysql-client

RUN mkdir /usr/src/toeictest
WORKDIR /usr/src/toeictest

COPY package.json ./

RUN npm install

COPY . .
