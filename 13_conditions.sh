#!/bin/bash

NUM=$1

if [ $NUM -gt 20 ] #gt,lt,eq, -ne,-ge,-le
then
    echo "Given number: $NUM is grater than 20"
else
    echo "Given number: $NUM is less than 20"
fi


