FROM ruby:2.6-alpine

RUN apk add --update --no-cache \
      build-base \
      nodejs \
      postgresql-dev \
      tzdata \
    && rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

ADD . /app
