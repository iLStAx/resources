#!/bin/bash
set -e

echo "Installing gems if missing"
bundle install
echo "Installing node modules if missing"
yarn
echo "Executing db setup if necessary"
rake db:migrate 2>/dev/null || rake db:setup

if [[ $RAILS_ENV == "production"  ]]; then
  echo "Precompile assets"
  rake assets:precompile
  echo "Executing app"
  rm -f tmp/pids/server.pid
  rails s -p 3000 -b 0.0.0.0
else
  echo "Development"
  echo "Executing app"
  rm -f tmp/pids/server.pid
  ./bin/webpack-dev-server &
  rails s -p 3000 -b 0.0.0.0
fi
