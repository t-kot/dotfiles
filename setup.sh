#!/bin/bash

DOT_FILES=(.zshrc .gitignore .gitconfig .vim .vimrc .vimshrc)

for file in ${DOT_FILES[@]} do
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

# install oh-my-zsh
[! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

git submodule init
git submodule update
