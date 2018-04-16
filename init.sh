#!/usr/bin/env bash

docker-compose down -v
# docker system prune -f

docker-compose up -d db
sleep 7
docker-compose up --build -d
docker-compose run rails_dev_1 migrate
docker-compose logs -f rails_dev_1
