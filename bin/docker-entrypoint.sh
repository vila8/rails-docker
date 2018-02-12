#!/bin/bash

set -e

case "$1" in
    dev)
        echo "Running Development Server on 0.0.0.0:3000"
        rails server -b 0.0.0.0
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