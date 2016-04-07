
This is my `.vim` folder, and now uses Neovim.

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

## Plugins

Plugins are managed via the excellent
[vim-plug](https://github.com/junegunn/vim-plug), and all defined in
`plugins.vim` file.

Run `:PlugUpdate` to update or install, run `:PlugClean` for occasional clean.


- Filer: [NERDTree][] (might switch to vimfiler, or use both)
- Finder: [fzf][], switched from ctrl-p to fzf for the support of neovim's async features.
- Status bar: [airline][], switched from powerline
- Theme: [Oceanic Next][] theme used by default, but configuration includes
  alternative themes such as [base16-vim][], [oceandeep][] and [tomorrow
  theme][].
- Git: [Fugitive][], [nerdtree-git-plugin][] and [vim-signify][] for better Git integration.
- Syntax: Syntax definitions for javascript, handlebars, markdown, cucumber
- Completion: [deoplete][] for its support of neovim's async features.
- Snippets: [ultisnips][]
- And some other plugins like Unite, ack.vim, tcomment, vim-devicons, emmet (zencoding) ...

[NERDTree]: https://github.com/scrooloose/nerdtree
[airline]: https://github.com/airline/airline
[fzf]: https://github.com/junegunn/fzf.vim
[Oceanic Next]: https://github.com/mhartington/oceanic-next
[base16-vim]: https://github.com/chriskempson/base16-vim
[oceandeep]: https://github.com/vim-scripts/oceandeep
[tomorrow theme]: https://github.com/chriskempson/vim-tomorrow-theme
[Fugitive]: https://github.com/tpope/vim-fugitive
[vim-signify]: https://github.com/mhinz/vim-signify
[deoplete]: https://github.com/Shougo/deoplete.nvim
[ultisnips]: https://github.com/sirver/ultisnips

## vimrc / init.vim

`init.vim` is just a symlink to `vimrc`. The first is used by neovim while the
latter is used by regular vim.

    source main.vim
    source plugins.vim
    source config.vim
    source theme.vim
    source mappings.vim
    source events.vim

    " Plugin specific configuration
    source gist.vim
    source nerdtree.vim
    source fzf.vim
    source deoplete.vim
    source airline.vim
    source ultisnips.vim

The vim configuration is split up in different files:

- main.vim - includes almost nothing and can bootstrap early config
- plugins.vim - vim-plug initialization and definitions of plugins used
- config.vim - where most of the standard vim configuration takes place
- mappings.vim - contains most of the general keybindings (not plugin specific)
- events - Autocommand stuff to hook certain action on particular Vim events
- {pluginName}.vim - contains plugin specific configuration and mappings

## plugin/relpath.vim

A little plugin that ease the process of navigating through a codebase using
that uses relative requires (eg. `require('./app')`). It just adds the ability
to `gf` onto a require statement to automatically open the required file.

Might end up in a separate repo.

## ftplugin/javascript.vim

A little thing to add a `:Require` command to easily add node like require statements.

Running `:Require fs path child_process` will generate:

    var fs = require('fs');
    var path = require('path');
    var child_process = require('child_process');
