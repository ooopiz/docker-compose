#!/usr/bin/env sh

if [ ! -f "sample-data/users.csv" ]; then
  curl -L --output sample-data/users.csv https://examples.citusdata.com/users.csv
fi

if [ ! -f "sample-data/events.csv" ]; then
  curl -L --output sample-data/events.csv https://examples.citusdata.com/events.csv
fi

