FROM ruby:2.5.3-alpine3.8

RUN apk update && apk add \
  build-base \
  postgresql-dev \
  libcurl \
  netcat-openbsd \
  nodejs \
  yarn

WORKDIR /app
ADD . /app

RUN gem install bundler -v 1.16.3
RUN bundle install

