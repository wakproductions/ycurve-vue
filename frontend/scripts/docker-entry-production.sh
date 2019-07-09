#!/bin/sh
set -e

# We are going to skip the build now for faster deploys, but if you want to build on the server this is how to do it
echo "Building deliverable"
yarn install
yarn build

exec "$@"