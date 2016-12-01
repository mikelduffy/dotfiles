#!/usr/bin/env bash

if [ hash apt-get 2>/dev/null ]; then
  hash git 2>/dev/null || apt-get install git
  git clone https://github.com/mikelduffy/dotfiles.git
  apt-get update && apt-get upgrade
  hash zsh 2>/dev/null || apt-get install zsh
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
  chsh -s $(which zsh)
  ln -s ./custom.zsh ~/.oh-my-zsh/custom/custom.zsh
  hash htop 2>/dev/null || apt-get install htop
  hash nvim 2>/dev/null || apt-get install nvim
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ln -s ./init.vim ~/.config/nvim/init.vim
  vim +PluginInstall +qall
fi
