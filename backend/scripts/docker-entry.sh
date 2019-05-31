#!/usr/bin/env sh

rm tmp/pids/server.pid

bundle install
rake db:migrate

exec "$@"