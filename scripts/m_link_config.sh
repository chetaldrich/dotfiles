#!/bin/bash

source ../lib.sh

# links miscellaneous configuration files for Mac

if [[ -z $(ls -a ~ | grep .zshrc) ]];then
    ln -s ~/dotfiles/msrc/zshrc ~/.zshrc
else
    read -r -p ".zshrc is already present. Link anyway? (y/*)" response

    if [[ $response =~ ^(yes|y|Y) ]];then
        rm ~/.zshrc
        ln -s ~/dotfiles/msrc/zshrc ~/.zshrc
    else
        print_yellow "Not replacing .zshrc"
    fi
fi

print_green "Shell configuration complete"
