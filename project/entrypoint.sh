#!/bin/sh

echo "Waiting for postgres..."
echo "DB HOST: ${DB_HOST}"
while ! nc -z ${DB_HOST} 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

exec "$@"