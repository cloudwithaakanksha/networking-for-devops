#!/bin/bash

HOST=$1
START=$2
END=$3

if [ -z "$HOST" ] || [ -z "$START" ] || [ -z "$END" ]; then
  echo "Usage: $0 <host> <start_port> <end_port>"
  exit 1
fi

for ((port=START; port<=END; port++)); do
  nc -z -v -w1 $HOST $port 2>&1 | grep -q succeeded && echo "Port $port is open"
done
