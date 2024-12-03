# MariaDB Universal Sensitive Data Store

This project provides a sensitive data store using MariaDB.

## Requirements

- [Docker](https://www.docker.com/) (ensure Docker is installed and running on your machine)

## Getting Started

1. Copy the .env.example file to .env and populate it with your own constants:
   ```bash 
   cp .env.example .env

2. Start the MariaDB container:
   ```bash
    docker-compose up -d

3. Give execution permission to the migrations script:
   ```bash
   chmod +x run_migrations.sh

4. Run the migrations script:
   ```bash
    ./run_migrations.sh

5. If all steps were successful, then you should have three MariaDB containers running and the tables from the
   migration scripts should be instantiated in each container instantiated.