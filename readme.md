
This is my .vim folder.

It started as a fork of [quick-vim][], but have diverged quite a bit.

vim/gvim config files based on [janus][] config. A good amount of vim goodies
were also taken from Derek's [vim-config][]

**Thanks**: [quick-vim][], [vim-config][], [janus][], [nvie's vimrc][]

[vim-config]: https://github.com/derekwyatt/vim-config/
[janus]: http://github.com/carlhuda/janus
[quick-vim]: https://github.com/brianleroux/quick-vim/
[nvie's vimrc]: https://github.com/nvie/vimrc

Installation
------------

Clone to `~/vimfiles` on windows, clone to `~/.vim` everywhere else.

```sh
# osx / nix
$ git clone https://github.com/mklabs/vimfiles.git ~/.vim

# windows
$ git clone https://github.com/mklabs/vimfiles.git ~/vimfiles
```

Then use the make to invoke the `install` target:

```sh
$ make install

# clones the list of bundles as listed in bundle.sh
# create $HOME/.vimrc and $HOME/.gvimrc if they don't exist already
```

**Note**: On windows, you need to rename the ~/.vimrc and ~/.gvimrc to
their windows equivalent ~/_vimrc & ~/_gvimrc (a `_` instead of `.`,
that's just the way it is on win32)
