#!/bin/bash

## Supported modes:
##  - interactive
## Description:
##  - Set global username and email for git
##  - Generate ssh keys for git and add them to ssh config
configure_git() {
    echo_info "Configure git"

    yes_or_no "Do you want to set global username and email for git?"
    if [ $? -eq 0 ]
    then
        USERNAME=$(read_input "Enter your username: ")
        git config --global user.name "$USERNAME"
        exit_if_error "Error setting global username"

        EMAIL=$(read_input "Enter your email: ")
        git config --global user.email "$EMAIL"
        exit_if_error "Error setting global email"
    fi

    yes_or_no "Do you want to generate ssh keys for github?"
    GENERATESSHKEYS=$?

    while [ $GENERATESSHKEYS -eq 0 ]
    do
        if [ ! -d ~/.ssh ]
        then
            mkdir ~/.ssh
        fi
        exit_if_error "Error creating ssh directory"
        
        EMAIL=$(read_input "Enter your email: ")
        FILENAME="${HOME}/.ssh/${EMAIL}_rsa"
        ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$FILENAME"
        exit_if_error "Error generating ssh key"

        yes_or_no "Do you want to add host definition and key to ssh config?"

        if [ $? -eq 0 ]
        then
            GITHUBHOST="github.com"
            HOST=$(read_input "Enter host name ($GITHUBHOST as default, could also be ${GITHUBHOST}-something to use different ssh keys for different repos): ")
            if [ -z "$HOST" ]
            then
                HOST=$GITHUBHOST
            fi
            echo "Host $HOST" >> ~/.ssh/config &&
            echo "  HostName $GITHUBHOST" >> "$HOME"/.ssh/config &&
            echo "  User git" >> ~/.ssh/config &&
            echo "  IdentityFile $FILENAME" >> "$HOME"/.ssh/config 
        fi
        exit_if_error "Error adding host definition and key to ssh config"

        yes_or_no "Do you want to generate another ssh key?"
        GENERATESSHKEYS=$?

        if [ $GENERATESSHKEYS -ne 0 ]
        then
            echo_message "Your ssh configuration is:"
            cat "${HOME}/.ssh/config"
            exit_if_error "Error reading ssh config"

            echo_message "Your ssh keys and configuration are:"
            ls -l "$HOME/.ssh"
            exit_if_error "Error reading ssh config"
            echo_info "Do not forget to add generated ssh keys to your github account using following instruction: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account"
            press_any_key
        fi
    done
}
