#!/bin/bash -x

# configure vim
read -p "Vim: this will overwrite your existing .vimrc and .vim. Countinue? y/n:" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	VIM_CONFIG_DIR=~/.vim/bundle/Vundle.vim
	VIM_RC_PATH=~/.vimrc

	rm -Rf ${VIM_CONFIG_DIR} ${VIM_RC_PATH}

	git clone https://github.com/VundleVim/Vundle.vim.git ${VIM_CONFIG_DIR}
	ln -s $(readlink -m vim/vimrc) ${VIM_RC_PATH}

	vim +PluginInstall +qall
fi

#i3 config
I3_CONFIG_PATH=~/.config/i3
ROFI_CONFIG_PATH=~/.config/rofi
ln -s $(readlink -m i3) ${I3_CONFIG_PATH}

SCREENSHOTS_DIR=/home/${USER}/Pictures/screenshots
mkdir -p ${SCREENSHOTS_DIR}
gsettings set org.gnome.gnome-screenshot auto-save-directory "file://${SCREENSHOTS_DIR}"

rm -Rf ${ROFI_CONFIG_PATH}
ln -s $(readlink -m i3/rofi) ${ROFI_CONFIG_PATH}
