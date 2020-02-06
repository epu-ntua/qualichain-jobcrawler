#!/usr/bin/env bash





echo 'Waiting for Postgres...'

while ! nc -z ${POSTGRES_HOST} 5432; do

  sleep 0.1

done
echo 'Postgres Initialization completed'



python init_db.py



while true; do

  sleep 0.1

done

