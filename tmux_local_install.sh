#!/bin/bash

# Credits to bbelgodere
# https://gist.github.com/bbelgodere/f77ee5e37ca661ad10ebe1f00020a8fd

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/local/x86/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

TMUX_VERSION=2.3

# create our directories
mkdir -p $HOME/local/x86 $HOME/tmux_tmp
cd $HOME/tmux_tmp

# download source files for tmux, libevent, and ncurses
wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
wget http://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz

# extract files, configure, and compile

############
# libevent #
############
tar xvzf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable
./configure --prefix=$HOME/local/x86 --disable-shared
make
make install
cd ..

############
# ncurses  #
############
tar xvzf ncurses-6.0.tar.gz
cd ncurses-6.0
./configure --prefix=$HOME/local/x86
make
make install
cd ..

############
# tmux     #
############
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I$HOME/local/x86/include -I$HOME/local/x86/include/ncurses" LDFLAGS="-L$HOME/local/x86/lib -L$HOME/local/x86/include/ncurses -L$HOME/local/x86/include"
CPPFLAGS="-I$HOME/local/x86/include -I$HOME/local/x86/include/ncurses" LDFLAGS="-static -L$HOME/local/x86/include -L$HOME/local/x86/include/ncurses -L$HOME/local/x86/lib" make
cp tmux $HOME/local/x86/bin
cd ..

# cleanup
rm -rf $HOME/tmux_tmp

echo "$HOME/local/x86/bin/tmux is now available. You can optionally add $HOME/local/x86/bin to your PATH."
