#!/bin/bash

set -e

bundle install

# crude way to wait for database container to be ready
sleep 20

#  create the database and run the migrations; if database is already
#+ created it will show an error message in the server logs but then
#+ move on.
rails db:create

# run migrations
rails db:migrate

exec bundle exec rackup -E $RAILS_ENV -p 3000 -o 0.0.0.0