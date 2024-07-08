FROM ruby:3.1
RUN set -eux && \
  apt-get update -qq && \
  apt-get install -y \
  postgresql-client

WORKDIR /book_admin
COPY Gemfile Gemfile.lock /book_admin/
RUN bundle install