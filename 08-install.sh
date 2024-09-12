#!/bin/bash

# Check if the user is root
USERID=$(id -u) #to check the user is having root access are not
 #     echo "user ID is:$USERID"
        if [ $USERID -ne 0 ]
then 
        echo "please run the script with root user"
        exit 1

fi


