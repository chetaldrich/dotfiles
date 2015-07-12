#!/bin/bash

source ../lib.sh

# links miscellaneous configuration files for Linux 

if [[ -z $(ls -a ~ | grep .bash_profile) ]];then
    ln -s ~/dotfiles/msrc/bash_profile ~/.bash_profile
else
    read -r -p ".bash_profile is already present. Link anyway? (y/*)" response

    if [[ $response =~ ^(yes|y|Y) ]];then
        rm ~/.bash_profile
        ln -s ~/dotfiles/msrc/bash_profile ~/.bash_profile
    else
        print_yellow "Not replacing .bash_profile"
    fi  
fi

print_green "Shell configuration complete"

