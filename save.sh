#!/bin/bash

# NVIM
rm -rf nvim
cp -rp ~/.config/nvim/lua/custom nvim

# zsh
cp ~/.zshrc zshrc

# Base Xresources
cp ~/.Xresources base_Xresources

# regolith2
cp -rp ~/.config/regolith2 regolith2
