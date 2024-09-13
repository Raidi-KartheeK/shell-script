#!/bin/bash

LOGS_FOLDER="/var/log/shell-practice" #log file
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) #$0 command run inside shell script # cut -d "." -f1 (dilimater)
TIMESTAMP=$(date +%Y-%M-%S-%H-%M-%S) #time stamp
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m" #reset color 
        
        USERID=$(id -u)   # Check if the user is root
        
        CHECK_ROOT(){ 
            #to check the user is having root access are not  #    echo "user ID is:$USERID"
        
         if [ $USERID -ne 0 ]
    then 
        echo -e"$R please run the script with root user $N" &>>$LOG_FILE
        exit 1

    fi
}
        VALIDATE(){
        if [ $1 -ne 0 ]
    then 
        echo -e "$2 is...$R FAILED $N" &>>$LOG_FILE
        exit 1 
    else 
        echo -e "$2 is...$G SUCCESS $N" &>>$LOG_FILE
    fi
} 

        USAGE(){
            echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1 package2 package3 ..."
            exit 1
     }
    # Run the root check function
    CHECK_ROOT
    
    if [ $# -eq 0 ]
    then
        USAGE

# Loop through the provided arguments (packages)
    for package in $@ # $@ is all arguments pass to it
    do 
        dnf list installed $package &>>$LOG_FILE
        if [ $? -ne 0 ]
    then
        echo "$package is not installed going to install it .."
        dnf install $package -y
        VALIDATE $? "installing $package" &>>$LOG_FILE
    else
        echo -e "$package is already $Y installed .. noting to do $N " &>>$LOG_FILE
        fi
    done
    