#!/bin/sh

PREFIX=~/.vim

warn() {
  echo "$1" >&2
}

die() {
  warn "$1"
  exit 1
}

[ -e "$PREFIX" ] && die "$PREFIX already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."
[ -e "~/.gvimrc" ] && die "~/.gvimrc already exists."

git clone git://github.com/mklabs/vimfiles.git $PREFIX

# Install plugin
cd $PREFIX
make install

# Symlink ~/.vim and ~/.vimrc
cd ~
ln -s "$PREFIX/vimrc" .vimrc
ln -s "$PREFIX/gvimrc" .gvimrc

echo "Installed and configured .vim, have fun."
