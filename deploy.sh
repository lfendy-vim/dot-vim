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

### fuzzy finder
# brew install fzf
# $(brew --prefix)/opt/fzf/install

### iterm gruvbox
# git@github.com:herrbischoff/iterm2-gruvbox.git

### iterm italics
# $ brew install ncurses
# $ /usr/local/opt/ncurses/bin/infocmp tmux-256color > ~/tmux-256color.info
# $ tic -xe tmux-256color tmux-256color.info
# # This creates a complied entry in ~/.terminfo
# $ infocmp tmux-256color | head
# #       Reconstructed via infocmp from file: /Users/libin/.terminfo/74/tmux-256color
# tmux-256color|tmux with 256 colors,

