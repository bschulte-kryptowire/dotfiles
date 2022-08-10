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

echo "Getting spaceship theme"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Update zshrc config
echo "----------------------------------------------"
echo "Updating .zshrc config"
cp ~/.zshrc ~/.zshrc-$(date +%s)
cp zshrc ~/.zshrc
