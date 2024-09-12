#!/bin/bash

#!/bin/bash

# Check if the user is root
R="\e[31m
G="\e[32m
Y="\e[33m
B="\e[34m
USERID=$(id -u)
CHECK_ROOT(){ #to check the user is having root access are not
                             #     echo "user ID is:$USERID"
        if [ $USERID -ne 0 ]
then 
        echo "please run the script with root user"
        exit 1

    fi
}
    VALIDATE(){
    if [ $1 -ne 0 ]
then 

        echo  -e "$2 is...$R FAILED $N"
        exit 1 
else 
        echo -e "$2 is...$G SUCCESS $N"
    fi
    } 
    CHECK_ROOT
     
     dnf list installed git
        if [ $? -ne 0 ]
then
        echo "git is not instlled , going to install it.."
        dnf install git -y
        VALIDATE $? #exit status check 
else
        echo "git is already installed"
fi

 
dnf install mysql #mysql installation
if [ $? -ne 0 ]
then
        echo "mysql is not installed at...going to install"
        dnf install mysql -y
        VALIDATE $? "installing mysql" #exit status check 

else
        echo "mysql is already installed ...."
fi




