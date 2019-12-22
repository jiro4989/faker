#!/bin/bash

set -eu

for module in \
  bank \
  barcode \
  color \
  company \
  credit_card \
  currency \
  date_time \
  file \
  geo \
  internet \
  isbn \
  job \
  lorem \
  misc \
  person \
  phone_number \
  profile \
  python \
  ssn \
  user_agent; do
  echo "module: $module"
  hub issue create -a jiro4989 -m "add '$module' module" -l feature
done
