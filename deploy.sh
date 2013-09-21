#!/bin/sh
if [ -e $HOME/.vim ]; then mv $HOME/.vim{,_bak}; fi
if [ -e $HOME/.vimrc ]; then mv $HOME/.vimrc{,_bak}; fi

ln -s `pwd` $HOME/.vim
ln -s `pwd`/.vimrc $HOME/.vimrc
