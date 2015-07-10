#!/bin/bash


msrc=./msrc
lsrc=./lsrc
ssrc=./ssrc
scripts=./scripts

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
}

function sinstall(){
    bird "Adding and symlinking vim configurations..."
    ./scripts/linkvim.sh
    
}
