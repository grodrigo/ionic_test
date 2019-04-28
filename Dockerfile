FROM node:11-alpine

WORKDIR /usr/src/app
RUN apk update && apk add openssh
RUN npm install -g ionic cordova
RUN ionic cordova prepare
RUN ionic cordova platform add android
RUN ionic cordova plugin add cordova-sqlite-storage

RUN npm install --save @ionic/storage

#COPY package.json .

ADD app .
RUN npm install

#RUN yarn

