# vimfiles

This is my cross-platform, cross-editor `~/.vim` folder.

## Installation

Using Neovim: Clone to `~/.config/nvim`.
```sh
# osx / nix
$ git clone https://github.com/mklabs/vimfiles.git ~/.config/nvim
```

Using vim: Clone to `~/vimfiles` on windows, clone to `~/.vim` everywhere else.

**Windows Note**: You need to rename the ~/.vimrc to its windows equivalent
`~/_vimrc` & `~/_gvimrc` (a `_` instead of `.`). The colorscheme is left to
default and can be configured in `_vimrc` file.

**Fonts note**: In order for vim-devicons to work, you'll need to install
[Droid sans Mono nerd
font](https://github.com/ryanoasis/nerd-fonts#font-installation) and run `sudo fc-cache -f -v` (tested on Ubuntu)

## Description

- Works well on unix, and pretty fine on Windows
- Small set of [plugins](#plugins) for general development
- Modular nvim / vim and common [configuration](#configuration). Plugins are
  loaded from their respective folders, using glob patterns.
- Includes [autoload/vmf.vim](./autoload/vmf.vim)
  - in use in vimrc to load plugins based on a glob pattern.
  - `vmf#{join,glob,source,log,debug,end}` functions
  - `:Vimfiles` Source a list of files using glob patterns
  - `:Vimfile` Calls Plug internally, taking care of calling plug#being / plug#end
  - `:VmfMessage` Logs are generated during the loading / install
    process, but not displayed to the screeen to avoid the infamous
    "Enter prompt to continue" message. This commands lets you see these
    logs.

## Plugins

See `./plugins.sh` to configure the list of plugins to install.

```bash
# Filer
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler.vim'

# Themes
Plug 'mhartington/oceanic-next'

# Syntax
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-cucumber'
Plug 'nono/vim-handlebars'

# Languages
Plug 'isruslan/vim-es6'
Plug 'bentayloruk/vim-react-es6-snippets'

# Lint
Plug 'neomake/neomake', { 'do': 'npm install --loglevel http -g eslint jsonlint' }

# Misc
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install --loglevel http' }
Plug 'vimlab/split-term.vim'
```

## Configuration

### vimrc

`init.vim` is just a symlink to `vimrc`. The first is used by neovim while the
latter is used by regular vim.

The vim configuration is split up in different files, using `Vimfiles` command
(defined in [autoload/vmf.vim](./autoload/vmf.vim)).

```vim
let g:VIMFILES_BUNDLES = vmf#join(g:VIMFILES_DIR, '.bundles')

" Load Common plugin configuration
Vimfiles 'config/common/*.vim'

" nvim / vim specific plugins
let dist = has('nvim') ? 'nvim' : 'vim'
Vimfiles 'config/' . dist . '/*.vim'

" Include GUI specific config
if has('gui')
  Vimfiles 'config/gui/*.vim'
endif

" can't find a corect colorscheme for powerline, giving up and leaving it up to the user to set
colorscheme default

if has('win32') === 0
  colorscheme OceanicNext
  set background=dark
endif

call vmf#end()
```

1. Common plugin and configurations are loaded with `Vimfiles
   'config/common/*.vim'`, namely [config/common/plugins.vim][]
2. nvim or vim specific plugins are loaded from their respective dir.
3. If running in a GUI environment (such as gvim or mvim), load GUI specific
   settings with `Vimfiles 'config/gui/*.vim'`
4. Default themse set to [Oceanic Next][] only for unix terminal or GUI environment.

### config/

```
config/
├── common
│   ├── airline.vim
│   ├── config.vim
│   ├── ctrlp.vim
│   ├── events.vim
│   ├── filer.vim
│   ├── gist.vim
│   ├── main.vim
│   ├── neomake.vim
│   ├── plugins.vim
│   ├── plug.vim
│   ├── startify.vim
│   ├── theme.vim
│   └── ultisnips.vim
├── mappings.vim
└── nvim
    ├── colors.vim
    ├── deoplete.vim
    └── tern.vim

2 directories, 17 files
```

#### config/common

- main.vim - includes almost nothing and can bootstrap early config
- plugins.vim - vim-plug initialization and definitions of plugins used
- config.vim - where most of the standard vim configuration takes place
- mappings.vim - contains most of the general keybindings (not plugin specific)
- events - Autocommand stuff to hook certain action on particular Vim events
- {pluginName}.vim - contains plugin specific configuration and mappings

#### config/nvim

Neovim specific config and plugins (deoplete, tern)

### UltiSnips/

List of [UltiSnips][] snippet for javascript, handlebars, html and vim.

## Credits

It started as a fork of [quick-vim][], but have diverged quite a bit.

vim/gvim config files based on [janus][] config. A good amount of vim goodies
were also taken from Derek's [vim-config][]

**Thanks**: [quick-vim][], [vim-config][], [janus][], [nvie's vimrc][]

[vim-config]: https://github.com/derekwyatt/vim-config/
[janus]: http://github.com/carlhuda/janus
[quick-vim]: https://github.com/brianleroux/quick-vim/
[nvie's vimrc]: https://github.com/nvie/vimrc
[config/common/plugins.vim]: ./config/common/plugins.vim
