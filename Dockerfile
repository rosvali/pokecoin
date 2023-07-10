FROM ruby:3.0.5

RUN bundle config --global frozen 1

WORKDIR usr/src/app

COPY Gemfile* .

RUN gem install bundler:2.4.14

RUN bundle install
