#!/bin/bash

source ../lib.sh

# Creates symlinks to vim configurations in common/

if [[ -z $(ls -a ~ | grep .vimrc) ]];then
    ln -s ~/dotfiles/common/vimrc ~/.vimrc
else
    read -r -p ".vimrc is already present. Link anyway? (y/*)" response

    if [[ $response =~ ^(yes|y|Y) ]];then
        rm ~/.vimrc
        ln -s ~/dotfiles/common/vimrc ~/.vimrc
    else
        print_yellow "Not replacing .vimrc"
    fi
fi

if [[ -z $(ls -a ~ | grep ^.vim$) ]];then
    ln -s ~/dotfiles/common/vim ~/.vim
else
    read -r -p ".vim directory is already present. Link anyway? (y/*)" response

    if [[ $response =~ ^(yes|y|Y) ]];then
        rm -rf ~/.vim
        ln -s ~/dotfiles/common/vim ~/.vim
    else
        print_yellow "Not replacing .vim"
    fi
fi

print_green "Vim configuration completed"
