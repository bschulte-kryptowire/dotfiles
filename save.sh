#!/bin/bash

# NVIM
rm -rf nvim
cp -rp ~/.config/nvim nvim

# zsh
cp ~/.zshrc zshrc

# Base Xresources
cp ~/.Xresources base_Xresources

# regolith2
rm -rf regolith2
cp -rp ~/.config/regolith2 .
