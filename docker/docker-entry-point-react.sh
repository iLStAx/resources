#!/bin/bash
set -e

echo "Installing modules if missing"
yarn install --network-timeout 500000
yarn start
