FROM ruby:2-alpine

RUN apk add --update ruby-dev build-base
RUN gem install selenium-webdriver
RUN apk del ruby-dev build-base
ADD setest.rb .

CMD /bin/sh
