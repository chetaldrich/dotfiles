#!/bin/bash

if [ -z "$(which brew)" ];then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# COMMAND LINE TOOLS
# Insert command line tools to be installed by brew here:
CLI=( caskroom/cask/brew-cask git ruby python3 node plt-racket gcc autojump go )

for item in "${CLI[@]}"
do
    if [ -z "$(which $item)" ];then
        brew install $item
    elif [ -n "$(which $item)" ];then
        brew upgrade $item
    fi
done

# GUI APPLICATIONS

# Insert command line tools to be installed by brew here:
GUI=( atom google-chrome )

read -r -p "Would you like to add desktop applications using Cask? (y/*)" response

if [[ $response =~ ^(yes|y|Y) ]];then
    for item in "${GUI[@]}"
    do
        if [ -z "$(which $item)" ];then
            brew cask install $item
        fi
    done
else
    echo "Ok. Those won't be installed."
fi
