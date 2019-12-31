#!/bin/bash

DB_NAME='toeictest'
DB_USER='toeictest'
DB_PASS='toeictest'
DB_HOST='mysql'

filename="./config/migrations/init.sql"

mysql -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME <"$filename"

echo "INIT SUCCESS"
