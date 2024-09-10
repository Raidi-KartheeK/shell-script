#!/bin/bash

USERID=$(ld -u)

if[$USERID -ne 0]; then
  echo "you need to be root user to execute this script"
  exit 1

fi
