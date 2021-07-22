FROM ruby:2.7.0

WORKDIR /appium

COPY Gemfile* ./

RUN bundle install

COPY . .
