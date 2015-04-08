#!/bin/bash


src=$HOME/dotfiles/src
scripts=$HOME/dotfiles/scripts

ESC_SEQ="\x1b["
COL_CYAN=$ESC_SEQ"36;01m"
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"

function bird(){
    echo -e "\n$COL_CYAN(o$COL_YELLOW>$COL_RESET $1$COL_CYAN\n/))$COL_RESET\n"
}

function run(){
    echo -en "$COL_YELLOW ⇒ $COL_RESET"$1": "
}

function install(){
    bird "Installing various command line tools..."
    ./scripts/brewinstall.sh
}
