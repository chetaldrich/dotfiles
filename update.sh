#!/bin/bash

# Chet Aldrich
# An install script for dotfiles

chmod +x scripts/*
chmod +x lib.sh
source ./lib.sh

bird "Hello! Welcome to the interactive install prompt!"

read -r -p "Linux, Server, or Mac? (mac/linux/server/*): " maclinuxresponse

if [[ $maclinuxresponse =~ ^(mac) ]];then
    minstall
elif [[ $maclinuxresponse =~ ^(linux) ]];then
    linstall
elif [[ $maclinuxresponse =~ ^(server) ]];then
    sinstall
else
    bird "Ok. Some other time."
fi
