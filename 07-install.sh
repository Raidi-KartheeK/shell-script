#!/bin/bash

# Check if the user is root
USERID=$(id -u) #to check the user is having root access are not
 #     echo "user ID is:$USERID"
        if [ $USERID -ne 0 ]
then 
        echo "please run the script with root user"
        exit 1

fi
dnf list installed git   #to dnf list that u installed 
        if [ $? -ne 0 ]
then
        echo "git is not instlled , going to install it.."
        dnf install git -y
        if [ $? -ne 0] #exit status check 
then
        echo "git installed is not sucess ...check it"

else
        echo "git installed is success"
        fi
else
        echo "git is allredy installed, noting to do"
        fi

dnf list install mysql #mysql installation
if [ $? -ne 0 ]
then
        echo "mysql is not installed at...going to install"
        dnf install mysql -y
        if [ $? -ne 0 ] #exit status check 
then
        echo "mysql installed ..going to insatll" #if not install install mysql
        exit1

else 
        echo "mysql installed sucess"
        fi
else
        echo "mysql is already installed ...."
fi



