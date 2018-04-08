FROM ruby:2.1.5

LABEL author="Jesús Vila <jvila@ciencias.unam.mx>"
LABEL version="1.3"

RUN apt-get update \
    && apt-get install -qq -y build-essential nodejs \
    libpq-dev postgresql-client --fix-missing --no-install-recommends

ENV home /usr/src/app
ENV scripts /usr/src/scripts/

WORKDIR ${scripts}
ADD bin/docker-entrypoint.sh .
RUN chmod +x docker-entrypoint.sh

WORKDIR ${home}
ADD app .

RUN bundle install

CMD rails server -p $PORT
