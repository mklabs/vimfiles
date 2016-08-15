# vimfiles

This is my cross-platform, cross-editor `~/.vim` folder.

Plugins are managed via the excellent
[vim-plug](https://github.com/junegunn/vim-plug), and all specifically defined
and loaded based on the platform (win32 or unix) and editor (vim or neovim).

The default theme for unix terminals and GUI is using [Oceanic Next][]. Windows
is left as default (I still need to find the correct setup with Powerline)

---

<div align="center">
  <img src="https://cdn.rawgit.com/mklabs/vimfiles/master/vim.png" alt="vimfiles"
    style="max-width:100%; height: 500px;" />
</div>

## Installation

Using Neovim: Clone to `~/.config/nvim`.
```sh
# osx / nix
$ git clone https://github.com/mklabs/vimfiles.git ~/.config/nvim
```

Using vim: Clone to `~/vimfiles` on windows, clone to `~/.vim` everywhere else.

```sh
# osx / nix
$ git clone https://github.com/mklabs/vimfiles.git ~/.vim
$ ln -s ~/.vim/vimrc ~/.vimrc

# windows
$ git clone https://github.com/mklabs/vimfiles.git $HOME/vimfiles
$ cp $HOME\vimfiles\_vimrc $HOME\_vimrc
```

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
  - higher lvl API and commands to work with vim-plug, in use in vimrc to load
    plugins based on a glob pattern.
  - `vmf#{join,glob,source,log,debug,end}` functions
  - `:Vimfiles` Source a list of files using glob patterns
  - `:Vimfile` Calls Plug internally, taking care of calling plug#being / plug#end
  - `:VmfMessage` Logs are generated during the loading / install
    process, but not displayed to the screeen to avoid the infamous
    "Enter prompt to continue" message. This commands lets you see these
    logs.

## Plugins

Plugins are managed via the excellent
[vim-plug](https://github.com/junegunn/vim-plug), and all defined in
[config/common/plugins.vim] file.

Run `:PlugUpdate` to update or install, run `:PlugClean` for occasional clean.

On first install, vim-plug will take care of running a few `npm install`
command required by some plugins (like installing eslint for Neomake /
Syntastic, or ternjs for completion with deoplete)

- Filer: [NERDTree][]
- Finder: [fzf][], fallback to [ctrlp][] for windows where fzf is not available
- Status bar: [vim-airline][]
- Theme: [Oceanic Next][] theme used by default, but configuration includes
  alternative themes such as [base16-vim][], [oceandeep][] and tomorrow
  theme.
- Git: [Fugitive][], [nerdtree-git-plugin][] and [vim-signify][] for better Git integration.
- Completion: [deoplete][] for its support of neovim's async features. Not loaded for vim config.
- Snippets: [UltiSnips][]
- Syntax: Syntax definitions for javascript, handlebars, markdown, cucumber
- And some other plugins like Unite, ack.vim, tcomment, vim-devicons, emmet (zencoding) ...

[NERDTree]: https://github.com/scrooloose/nerdtree
[vim-airline]: https://github.com/vim-airline/vim-airline
[fzf]: https://github.com/junegunn/fzf.vim
[Oceanic Next]: https://github.com/mhartington/oceanic-next
[base16-vim]: https://github.com/chriskempson/base16-vim
[oceandeep]: https://github.com/vim-scripts/oceandeep
[tomorrow theme]: https://github.com/chriskempson/vim-tomorrow-theme
[Fugitive]: https://github.com/tpope/vim-fugitive
[vim-signify]: https://github.com/mhinz/vim-signify
[deoplete]: https://github.com/Shougo/deoplete.nvim
[UltiSnips]: https://github.com/sirver/ultisnips
[ctrlp]: https://github.com/ctrlpvim/ctrlp.vim

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
│   ├── events.vim
│   ├── filer.vim
│   ├── gist.vim
│   ├── init.vim
│   ├── main.vim
│   ├── mappings.vim
│   ├── plugins.vim
│   ├── plug.vim
│   ├── syntastic.vim
│   ├── theme.vim
│   ├── ultisnips.vim
│   └── unite.vim
├── nix
│   └── fzf.vim
├── nvim
│   ├── deoplete.vim
│   ├── plugins.vim
│   └── tern.vim
└── win32
    └── ctrlp.vim
```

#### config/common

- main.vim - includes almost nothing and can bootstrap early config
- plugins.vim - vim-plug initialization and definitions of plugins used
- config.vim - where most of the standard vim configuration takes place
- mappings.vim - contains most of the general keybindings (not plugin specific)
- events - Autocommand stuff to hook certain action on particular Vim events
- {pluginName}.vim - contains plugin specific configuration and mappings

#### config/win32

Windows specific config and plugins (ctrlp).

#### config/nix

Unix specific config and plugins (fzf).

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
