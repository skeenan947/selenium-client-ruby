FROM ruby:2-alpine

RUN apk add --update ruby-dev build-base && gem install selenium-webdriver && apk del ruby-dev build-base
ADD setest.rb .

CMD /bin/sh
