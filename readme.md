
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

Bundles
-------

Plugins are managed through pathogen and installed typically in
`~/.vim/bundle` directory. The pathogen config:

**Note** Additionnaly, the vimrc file adds `~/src/vim/bundle` directory
to pathogen runtime path. You can change it or leave it, it won't affect
your setup. This is usually where I keep custom vim plugins.

To update or install, simply run `pathogenify install` script (or `make
install`). The script parses the content of the present readme file,
looking for the following list of bundles to install.

- **Fugitive**:          `git clone git://github.com/tpope/vim-fugitive.git`
- **NerdTree**:          `git clone git://github.com/scrooloose/nerdtree.git`
- **Syntastic**:         `git clone git://github.com/scrooloose/syntastic.git`
- **Zencoding**:         `git clone git://github.com/mattn/zencoding-vim.git`
- **Snipmate**:          `git clone git://github.com/msanders/snipmate.vim.git`
- **Ack**:               `git clone git://github.com/mileszs/ack.vim.git`
- **Clam**:              `git clone git://github.com/sjl/clam.vim.git`
- **CtrlP**:             `git clone git://github.com/kien/ctrlp.vim.git`
- **haml**:              `git clone git://github.com/tpope/vim-haml.git`
- **markdown**:          `git clone git://github.com/tpope/vim-markdown.git`
- **cucumber**:          `git clone git://github.com/tpope/vim-cucumber.git`
- **tabular**:           `git clone git://github.com/godlygeek/tabular.git`
- **tcomment**:          `git clone git://github.com/tomtom/tcomment_vim.git`
- **surround**:          `git clone git://github.com/tpope/vim-surround.git`
- **repeat**:            `git clone git://github.com/tpope/vim-repeat.git`
- **rhubarb**:           `git clone git://github.com/tpope/vim-rhubarb.git`
- **gist**:              `git clone git://github.com/mattn/gist-vim.git`
- **javascript**:        `git clone git://github.com/pangloss/vim-javascript.git`
- **coffeescript**:      `git clone git://github.com/kchmck/vim-coffee-script.git`
- **handlebars**:        `git clone git://github.com/nono/vim-handlebars.git`
- **github**:            `git clone git://github.com/thinca/vim-github.git`
- **powerline**:         `git clone git://github.com/Lokaltog/vim-powerline.git`

### API Bundles

These are special vim plugins providing handy API for others plugin to
consume.

- **open-browser**:     `git clone git://github.com/tyru/open-browser.vim.git`
- **webapi-vim**:       `git clone git://github.com/mattn/webapi-vim.git`

### CtrlP extensions.

http://kien.github.com/ctrlp.vim/

CtrlP is a really nice alternative to the well known Command-T plugin. It
doesn't require ruby and has really interresting extending capability.

The following bundles are CtrlP extensions, see `:h ctrlp-extensions`

- **ctrlp-hackernews**: `git clone git://github.com/mattn/ctrlp-hackernews.git`
- **ctrlp-gist**:       `git clone git://github.com/mattn/ctrlp-gist.git`
- **ctrlp-git**:        `git clone git://github.com/mattn/ctrlp-git.git`
- **ctrlp-funky**:      `git clone git://github.com/tacahiroy/ctrlp-funky.git`

### CtrlP Funky JS

ctrlp-funky is a ctrlp extensions that offers abstractions to parse
being edited file(s) without ctags.

It supports various filetypes like markdown, ruby or vim.

Custom adapters can be defined, they are autoload functions within the
`ctrlp#funky` namespace, and must be named after the filetype they
support: `ctrlp#funky#{ft}.vim`.

In `custom-bundle/ctrlp-jsfunky` is defined a basic ctrlp-funky adapter
for the javascript filetype, it parses out var and function statements.
Which is a good start.

To use, simply edit a JavaScript file and run `:CtrlPFunky`.
