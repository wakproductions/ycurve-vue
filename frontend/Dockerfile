FROM nginx:1.15.12-alpine

RUN apk update && apk add nodejs yarn

WORKDIR /app
ADD . /app
