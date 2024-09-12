#!/bin/bash

NUMBER=$!

if [ $NUMBER -gt 20 ]
then
    echo "Given number: $NUMBER is grater than 20"
else
    echo "Given number: $NUMBER is less than 20"
fi
