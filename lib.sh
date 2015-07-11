#!/bin/bash

msrc=./msrc
lsrc=./lsrc
ssrc=./ssrc
scripts=./scripts

ESC_SEQ="\x1b["
COL_CYAN=$ESC_SEQ"36;01m"
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_RED=$ESC_SEQ"0;31m"
COL_GREEN=$ESC_SEQ"0;32m"

function bird(){
    echo -e "\n$COL_CYAN(o$COL_YELLOW>$COL_RESET $1$COL_CYAN\n/))$COL_RESET\n"
}

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

function linstall(){
    bird "Updating apt-get..."
    sudo apt-get update
    bird "Adding and symlinking vim configurations..."
    ./scripts/linkvim.sh

}

function minstall(){
    bird "Installing various command line tools for OSX..."
    ./scripts/brewinstall.sh
    bird "Installing Atom packages..."
    ./scripts/apm.sh
    bird "Adding and symlinking vim configurations..."
    ./scripts/linkvim.sh
    bird "Adding shell configurations..."
    ./scripts/m_link_config.sh
}

function sinstall(){
    bird "Adding and symlinking vim configurations..."
    ./scripts/linkvim.sh
}
