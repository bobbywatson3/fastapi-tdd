#!/bin/sh

set -e

docker-compose down -v
docker-compose up -d --build
docker-compose exec web aerich upgrade
docker-compose exec web python -m pytest
docker-compose exec web flake8 .
docker-compose exec web black .
docker-compose exec web isort .
docker-compose down -v