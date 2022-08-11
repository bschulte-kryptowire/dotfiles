#!/bin/bash

# https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0?permalink_comment_id=4005789#gistcomment-4005789
download_nerd_fonts() {
	declare -a fonts=(
	    BitstreamVeraSansMono
	    CodeNewRoman
	    FiraMono
	    Go-Mono
	    Hack
	    Hasklug
	    Hermit
	    Inconsolata
	    JetBrainsMono
	    Meslo
	    Noto
	    Overpass
	    ProggyClean
	    RobotoMono
	    SourceCodePro
	    SpaceMono
	    Ubuntu
	    UbuntuMono
	)

	if [ -e ~/.nerd-fonts-downloaded.txt ]; then
		return
	fi

	version='2.1.0'
	fonts_dir="${HOME}/.local/share/fonts"

	if [[ ! -d "$fonts_dir" ]]; then
	    mkdir -p "$fonts_dir"
	fi

	for font in "${fonts[@]}"; do
	    zip_file="${font}.zip"
	    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
	    echo "Downloading $download_url"
	    wget "$download_url"
	    unzip "$zip_file" -d "$fonts_dir"
	    rm "$zip_file"
	    sleep 2
	done

	find "$fonts_dir" -name '*Windows Compatible*' -delete

	fc-cache -fv
	# We write to this file as a marker that we've already downloaded these fonts
	echo "downloaded" > ~/.nerd-fonts-downloaded.txt
}

build_and_install_neovim() {
	echo "Building neovim..."	
	# Install prereqs
	sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

	if [ ! -d ~/repos/neovim ];then
		git clone https://github.com/neovim/neovim ~/repos/neovim
	fi

	cd ~/repos/neovim
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install

}

####### START #######
mkdir -p ~/repos
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
sudo apt install -y fzf &> /dev/null

# z
if [ ! -d ~/repos/z ];then
	git clone https://github.com/rupa/z.git ~/repos/z
fi

# Dropbox
if [ -d ~/Dropbox ]; then
	echo "Dropbox already installed"
else
	echo "Installing Dropbow..."
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
fi

# Regolith packages
# Includes:
#   - Compositor (nice graphics and animations)
#   - Status indicators
#   - Battery status
sudo apt install -y regolith-compositor-picom-glx i3xrocks-rofication i3xrocks-memory i3xrocks-battery 
# Looks (themes)
sudo apt install regolith-look-ayu-dark regolith-look-blackhole regolith-look-dracula regolith-look-nord regolith-look-solarized-dark

# Nerd Fonts
download_nerd_fonts

# Update zshrc config
echo "----------------------------------------------"
echo "Updating .zshrc config"
cp ~/.zshrc ~/.zshrc-$(date +%s)
cp zshrc ~/.zshrc

# Xresources
cp ~/.Xresources ~/.Xresources-$(date +%s)
cp base_Xresources ~/.Xresources

# Background
cp ./material_1_bg.jpg ~/Pictures

# Neovim
if ! command -v nvim &> /dev/null; then
	build_and_install_neovim
fi
# Neovim - configuration
mkdir -p ~/.config/nvim
cp -rp nvim ~/.config/nvim
