#!/bin/bash

if [ -z "$(which brew)" ];then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# COMMAND LINE TOOLS
# Insert command line tools to be installed by brew here:
CLI=( git ruby python3 node plt-racket gcc )

for item in "${CLI[@]}"
do
    if [ -z "$(which $item)" ];then
        brew install $item
    elif [ -n "$(which $item)" ];then
        brew upgrade $item
    fi
done
