#!/bin/bash

# configure vim
VIM_CONFIG_DIR=~/.vim/bundle/Vundle.vim
VIM_RC_PATH=~/.vimrc

rm -Rf ${VIM_CONFIG_DIR} ${VIM_RC_PATH}

git clone https://github.com/VundleVim/Vundle.vim.git ${VIM_CONFIG_DIR}
ln -s $(readlink -m vim/vimrc) ${VIM_RC_PATH}

vim +PluginInstall +qall
