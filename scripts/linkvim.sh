#!/bin/bash

source ../lib.sh

# Creates symlinks to vim configurations in common/

if [[ -z $(cd ~; ls -a ~ | grep .vimrc) ]];then
    ln -s ~/dotfiles/common/vimrc ~/.vimrc
else
    read -r -p ".vimrc is already present. Link anyway? (y/*)" response

    if [[ $response =~ ^(y) ]];then
        rm ~/.vimrc
        ln -s ~/dotfiles/common/vimrc ~/.vimrc
    else
        echo -e "${COL_YELLOW} not replacing .vimrc ${COL_RESET}"
    fi
fi

if [[ -z $(cd ~; ls -a ~ | grep ^.vim$) ]];then
    ln -s ~/dotfiles/common/vim ~/.vim
else
    read -r -p ".vim directory is already present. Link anyway? (y/*)" response

    if [[ $response =~ ^(y) ]];then
        rm -rf ~/.vim
        ln -s ~/dotfiles/common/vim ~/.vim
    else
        echo -e "${COL_YELLOW} not replacing .vim ${COL_RESET}"
    fi
fi
