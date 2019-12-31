#!/bin/bash

DB_NAME='toeictest'
DB_USER='toeictest'
DB_PASS='toeictest'
DB_HOST='mysql'

echo 'Getting data version'
version=$(mysql -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME -e "SELECT name FROM version")
#trim string to get current version name
x="./config/migrations/$version"

echo "$version"
MIGRATION_PATH="./config/migrations/*"

for filename in $MIGRATION_PATH; do
  if [[ -f $filename ]]; then
    if [[ "$filename" > "$x" ]] || [ "$filename" == "$x" ]; then
      echo "Running migration file: $filename"
      mysql -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME <"$filename"
    fi
  fi
done
