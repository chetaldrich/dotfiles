#!/bin/bash

# Chet Aldrich
# An install script for dotfiles

chmod +x lib/*
chmod +x lib.sh
source ./lib.sh

# Creates symlinks to vim configurations in dotfiles/
prompt_install_home vimrc dotfiles 
prompt_install_home vim dotfiles 
prompt_install_home zshrc dotfiles 
