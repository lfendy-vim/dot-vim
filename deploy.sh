#!/bin/bash
git submodule init
git submodule update

if [ -e $HOME/.vim ]; then mv $HOME/.vim{,_bak}; fi
if [ -e $HOME/.vimrc ]; then mv $HOME/.vimrc{,_bak}; fi
if [ -e $HOME/.tmux.conf ]; then mv $HOME/.tmux.conf{,_bak}; fi

ln -s `pwd` $HOME/.vim
ln -s `pwd`/.vimrc $HOME/.vimrc
ln -s `pwd`/.tmux.conf $HOME/.tmux.conf

vim +PluginInstall +qall

# brew install fzf
# $(brew --prefix)/opt/fzf/install
