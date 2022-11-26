#!/bin/bash
set -e

echo "Installing gems if missing"
bundle install

echo "Executing app"
bundle exec sidekiq
