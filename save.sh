#!/bin/bash

# NVIM
cp -rp ~/.config/nvim .
rm -rf nvim/plugged

# zsh
cp ~/.zshrc zshrc

# Base Xresources
cp ~/.Xresources base_Xresources

# regolith2
cp -rp ~/.config/regolith2 regolith2
