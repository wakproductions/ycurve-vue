FROM nginx:1.15.12-alpine

RUN apk update && apk add nodejs yarn
RUN yarn install

WORKDIR /app
ADD . /app
