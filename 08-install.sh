#!/bin/bash

# Check if the user is root
USERID=$(id -u) #to check the user is having root access are not
 #     echo "user ID is:$USERID"
        if [ $USERID -ne 0 ]
then 
        echo "please run the script with root user"
        exit 1

fi
dnf list installed git 
        if [ $? -ne 0 ]
then
        echo "git is not instlled , going to install it.."
        dnf install git -y
else
        echo "git is allredy installed, noting to do"
fi


