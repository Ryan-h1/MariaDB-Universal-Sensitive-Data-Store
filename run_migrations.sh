#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
  export "$(grep -v '^#' .env | xargs)"
else
  echo ".env file not found! Please make sure it exists and is properly configured."
  exit 1
fi

# Define the database container and migration directory
DB_CONTAINER="mariadb_node1"
MIGRATION_DIR="./migrations"

# Check if migration directory exists
if [ ! -d "$MIGRATION_DIR" ]; then
  echo "Migration directory '$MIGRATION_DIR' does not exist!"
  exit 1
fi

# Run each migration script
for FILE in $MIGRATION_DIR/*.sql; do
  if [ -f "$FILE" ]; then
    echo "Running migration: $FILE"
    docker exec -i $DB_CONTAINER mysql -u"$MARIADB_USER" -p"$MARIADB_PASSWORD" "$MARIADB_DATABASE" < "$FILE"
    if [ $? -ne 0 ]; then
      echo "Failed to run migration: $FILE"
      exit 1
    fi
  fi
done

echo "All migrations have been successfully applied."