#!/bin/bash

set -e

# Check if the required PostgreSQL environment variables are set
[ -z "$POSTGRES_DB" ] && echo "ERROR: Need to set POSTGRES_DB" && exit 1;
[ -z "$POSTGRES_USER" ] && echo "ERROR: Need to set POSTGRES_USER" && exit 1;
[ -z "$POSTGRES_PASSWORD" ] && echo "ERROR: Need to set POSTGRES_PASSWORD" && exit 1;


case "$1" in
    dev)
        echo "Running Development Server on ${HOST:=0.0.0.0}:${PORT:=3000}"
        rails server -b $HOST -p $PORT
    ;;
    create)
        echo "Crating DB"
        bin/rake db:create
    ;;
    migrate)
        echo "Migrating DB"
        bin/rake db:migrate
    ;;
    bash)
        /bin/bash "${@:2}"
    ;;
esac