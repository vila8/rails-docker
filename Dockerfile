FROM ruby:2.1.5
LABEL version="1.0"

RUN apt-get update \
    && apt-get install -qq -y build-essential nodejs \
    libpq-dev postgresql-client --fix-missing --no-install-recommends

ENV home /usr/src/
WORKDIR $home

ADD app $home

RUN bundle install
