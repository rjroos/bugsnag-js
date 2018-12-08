FROM node:10-alpine as ci

RUN apk add --update bash

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . ./
RUN npx lerna bootstrap
RUN npm run build