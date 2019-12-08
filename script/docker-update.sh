#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting update..."
echo "-> Docker image will be rebuilt if necessary"
echo "-> Database schema will be updated if necessary"
echo "-> Webpack will compile assets"

docker-compose build
docker-compose run --rm app yarn install # needed to avoid yarn integrity check fail
docker-compose run --rm -e UPDATE=1 app

echo "Update completed."