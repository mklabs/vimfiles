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
