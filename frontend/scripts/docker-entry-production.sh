#!/bin/sh
set -e
echo "Building deliverable"

yarn
yarn run build

exec "$@"