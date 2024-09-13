#!/bin/bash

LOGS_FOLDER="/var/log/git-shell-script" # Log file directory
SCRIPT_NAME=$(basename $0 | cut -d "." -f1) # $0: command run inside shell script, basename strips the path
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S) # Timestamp in a more conventional format
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

# Colors for output
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m" # Reset color 

USERID=$(id -u) # Check if the user is root

CHECK_ROOT(){ 
    # Check if the user has root access
    if [ $USERID -ne 0 ]; then 
        echo -e "$R Please run the script as root user $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo -e "$2 is...$R FAILED $N" | tee -a $LOG_FILE
        exit 1 
    else
        echo -e "$2 is...$G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE: $N sudo sh 17-redirectors.sh package1 package2 package3 ..."
    exit 1
}

# Main execution starts here
echo "Script started executing at: $(date)"

# Run the root check function
CHECK_ROOT

# Check if at least one argument is passed
if [ $# -eq 0 ]; then
    USAGE
fi

# Loop through the provided arguments (packages)
for package in "$@"; do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        echo "$package is not installed, going to install it..."
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed, nothing to do $N" | tee -a $LOG_FILE
    fi
done

