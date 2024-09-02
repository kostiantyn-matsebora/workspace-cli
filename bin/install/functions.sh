# !/bin/bash

timestamp() {
  date +%F_%T # current date and time
}

green() {
    echo -e "\033[0;32m$1\033[0m"
}

yellow() {
    echo -e "\033[0;33m$1\033[0m"
}

red() {
    echo -e "\033[0;31m$1\033[0m"
}

green_bold() {
    echo -e "\033[1;92m$1\033[0m"
}

echo_message(){    
    echo -e $(green "[$(timestamp)] $1\n")
}

echo_info(){
    echo -e "\n"
    echo -e $(yellow "[$(timestamp)] $1\n")

}

echo_error(){
    echo -e $(red "[$(timestamp)] $1\n")
    echo -e "\n"
}

function question(){
    local MESSAGE=$(green_bold "[$(timestamp)] $1\n")  
    read -sn 1 -p "$MESSAGE" ANSWER
    echo  "$ANSWER"    
}


function exit_if_error(){
    if [ "$?" -ne "0" ]
    then
        echo_error "$1"
        exit $?
    fi
}

function yes_or_no(){
    local ANSWER=$(question "$1 [y/n]")
    if [[ "$ANSWER" = "y" || "$ANSWER" = "Y" ]]
    then
        return 0
    else
        return 1
    fi
}

function exit_if_answer_no() {
    if [[ $? -ne 0 ]]
    then
        echo_message "Exiting..."
        exit 0
    fi
}