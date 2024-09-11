#!/bin/bash

#how to store the key values pairs
declare -A details
details=( [name]=raidi [age]=30 [city]=kgm)

echo "Name is ${details[name]}"
echo "age is ${details[age]}"


