#!/bin/bash

# NVIM
cp -rp ~/.config/nvim .
rm -rf nvim/plugged

# zsh
cp ~/.zshrc zshrc

# Base Xresources
cp ~/.Xresources base_Xresources

cp -rp ~/.config/regolith2 regolith2
