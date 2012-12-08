
> Yup... it's a vim configuration.

This is my .vim folder.

It started as a fork of [quick-vim][], but it's going to diverge quite a bit.

vim/gvim config files based on [janus][] config. A good amount of vim goodies
were also taken from Derek's [vim-config][]

**Thanks**

* [quick-vim][]
* [vim-config][]
* [janus][]
* [nvie's vimrc][]

[vim-config]: https://github.com/derekwyatt/vim-config/
[janus]: http://github.com/carlhuda/janus
[quick-vim]: https://github.com/brianleroux/quick-vim/
[nvie's vimrc]: https://github.com/nvie/vimrc

Installation
------------

### one-liner

```sh
curl https://raw.github.com/mklabs/vimfiles/master/autoinstall.sh | sh
```

### manual install

Clone to `~/vimfiles` on windows, clone to `~/.vim` everywhere else.

```sh
# osx / nix
$ git clone https://github.com/mklabs/vimfiles.git ~/.vim

# windows
$ git clone https://github.com/mklabs/vimfiles.git ~/vimfiles
```

Run `make` to install it.

**Note**: On windows, cygwin is most likely required to run make.
You'll then need to rename the ~/.vimrc and ~/.gvimrc to their windows
equivalent ~/_vimrc & ~/_gvimrc (a `_` instead of `.`, that's just the way it
on win32)

Bundles
-------

Plugins are managed through pathogen and installed typically in
`~/.vim/bundle` directory. The pathogen config:

**Note** Additionnaly, the vimrc file adds `~/src/vim/bundle` directory
to pathogen runtime path. You can change it or leave it, it won't affet
your setup. This is usually where I keep custom vim plugins.

To update or install, simply run `bundle/install` script (or `make
bundle`). The script parses the content of the present readme file,
looking for the following list of bundles to install.

- **Fugitive**:          `git clone git://github.com/tpope/vim-fugitive.git`
- **NerdTree**:          `git clone git://github.com/scrooloose/nerdtree.git`
- **Syntastic**:         `git clone git://github.com/scrooloose/syntastic.git`
- **Sparkup**:           `git clone git://github.com/rstacruz/sparkup.git`
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

- **colors-solarized**:  `git clone git://github.com/altercation/vim-colors-solarized.git`

### API Bundles

These are special vim plugins providing handy API for other plugin to
consume.

- **open-browser**:     `git clone git://github.com/tyru/open-browser.vim.git`
- **webapi-vim**:       `git clone git://github.com/mattn/webapi-vim.git`
