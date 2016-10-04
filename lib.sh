#!/bin/bash

ESC_SEQ="\x1b["
COL_CYAN=$ESC_SEQ"36;01m"
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_RED=$ESC_SEQ"0;31m"
COL_GREEN=$ESC_SEQ"0;32m"

function run(){
    echo -en "$COL_YELLOW ⇒ $COL_RESET"$1": "
}

function print_yellow() {
    echo -e "${COL_YELLOW} $1 ${COL_RESET}"
}

function print_red() {
    echo -e "${COL_RED} $1 ${COL_RESET}"
}

function print_green() {
    echo -e "${COL_GREEN} $1 ${COL_RESET}"
}

# Symlinks into the home directory. 
# Usage: 
# prompt_install_home param1 param2
# where 
# $1 = file name inside of dotfiles, without .
# $2 = src file to install from 
function prompt_install_home() {
    if [[ -z $(ls -a ~ | grep .$1) ]];then
        ln -s ~/shell_config/$2/$1 ~/.$1
        print_green ".$1 installed"
    else
        read -r -p ".$1 is already present. Link anyway? (y/*)" response
        if [[ $response =~ ^(yes|y|Y) ]];then
            rm -rf ~/.$1
            ln -s ~/shell_config/$2/$1 ~/.$1
            print_green ".$1 installed"
        else
            print_yellow "Not replacing .$1"
        fi  
    fi

    print_green ".$1 configuration complete" 
}
