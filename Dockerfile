FROM ruby:2.1.5
MAINTAINER Jesús Vila <jvila@ciencias.unam.mx>
LABEL version="1.1"

RUN apt-get update \
    && apt-get install -qq -y build-essential nodejs \
    libpq-dev postgresql-client --fix-missing --no-install-recommends

ENV home /usr/src/app
ENV scripts /usr/src/scripts/
WORKDIR $home

ADD app $home
ADD bin/docker-entrypoint.sh $scripts
RUN chmod +x ${scripts}/docker-entrypoint.sh

RUN bundle install
