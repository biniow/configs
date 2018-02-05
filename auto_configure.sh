#!/bin/bash

# configure vim
git clone https://github.com/VundleVim/Vundle.vim.git vim/vim/bundle/Vundle.vim
ln -s $(readlink -m vim/vim) ~/.vim
ln -s $(readlink -m vim/vimrc) ~/.vimrc
