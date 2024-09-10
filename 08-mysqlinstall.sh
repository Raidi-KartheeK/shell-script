#!/bin/bash

# Check if the user is root
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "You need to be root user to execute this script"
  exit 1
fi

# Install MySQL using DNF
dnf install mysql -y

# Check if the installation was successful
if [ $? -ne 0 ]; then
  echo "MySQL installation failed"
  exit 1
else
  echo "MySQL installation is successful"
fi
