# #!/bin/bash

# USERID =$(id -u)

# CHECK_ROOT (){
#         if [$USERID -ne 0]
#         then
#         echo "Run the user with root priveleges"
#         exit 1
# fi
# }

# VALIDATE () {
#         if [$1 -ne 0]
#         then
#                 echo "$2 is failed"
#                 exit 1
#         else
#                 echo "$2 is success"
#         fi
# }

# CHECK_ROOT

# dnf list installed git
# if [ $? -ne 0 ]
# then
#         echo "git is not instlled  going to install it.."
#         dnf install git -y
#         VALIDATE $? "installing git" 
# else
#         echo "git is already installed"
# fi

# dnf list install mysql #mysql installation
# if [ $? -ne 0 ]
# then
#         echo "mysql is not installed at...going to install"
#         dnf install mysql -y
#         VALIDATE $? "installing mysql" #exit status check 

# else
#         echo "mysql is already installed ...."
# fi



#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "python3"