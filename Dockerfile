FROM ruby:3.0.6-buster

RUN bundle config --global frozen 1

WORKDIR usr/src/app

COPY Gemfile* .

RUN gem install bundler:2.4.14

RUN bundle lock --add-platform x86_64-linux

RUN bundle install

COPY . .

EXPOSE 3000

# CMD ["rails", "server", "-b", "0.0.0.0"]