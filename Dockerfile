FROM ruby:2-alpine

ADD Gemfile /root/
WORKDIR /root
RUN apk add --update ruby-dev build-base bash vim ruby-ffi && \
    gem install bundler && \
    bundle install && \
    apk del ruby-dev build-base

ADD setest .
ENTRYPOINT ["bundle","exec","setest"]
