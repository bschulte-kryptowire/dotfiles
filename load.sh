#!/bin/bash

### Zsh
ZSH_CUSTOM=/home/bschulte/.oh-my-zsh/custom

# on-my-zsh
echo "----------------------------------------------"
if [ -d ~/.oh-my-zsh ]; then
	echo "oh-my-zsh is installed"
 else
	echo "Installing oh-my-zsh, you likely have to run this script again after this install"
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -e /home/bschulte/.oh-my-zsh/custom/themes/spaceship.zsh-theme ]; then
	echo "Spaceship theme already installed"
else
	echo "Getting spaceship theme"
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

# FZF
sudo apt install -y fzf

# Dropbox
if [ -d ~/Dropbox ]; then
	echo "Dropbox already installed"
else
	echo "Installing Dropbow..."
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
fi

# Regolith packages
sudo apt install -y regolith-compositor-picom-glx


# Update zshrc config
echo "----------------------------------------------"
echo "Updating .zshrc config"
cp ~/.zshrc ~/.zshrc-$(date +%s)
cp zshrc ~/.zshrc
