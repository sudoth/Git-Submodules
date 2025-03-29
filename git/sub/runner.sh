#!/bin/bash

./server/service-init.sh

sum=0
for colour in "$@"; do
  echo "$colour" > server/in.fifo
  read ans < server/out.fifo
  sum=$((sum + ans))
done

./server/service-shutdown.sh

echo "$sum"
