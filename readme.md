## vim config

vim/gvim config files based on [janus](https://github.com/carlhuda/janus) config.

---

Plugins are managed via
[Pathogen](https://github.com/tpope/vim-pathogen). installation / update
script is based on [@brianleroux's quick-vim](https://github.com/brianleroux/quick-vim).

The vim directory here is copied to `~/.vim/` when `./quick-vim install` or
`./quick-vim upgrade` is run.

**bundle.txt**

```
git://github.com/scrooloose/nerdtree.git
git://github.com/scrooloose/syntastic.git
git://github.com/tpope/vim-surround.git
git://github.com/tpope/vim-markdown.git
git://github.com/mattn/zencoding-vim.git
git://github.com/mattn/gist-vim.git
git://github.com/pangloss/vim-javascript.git
git://github.com/kchmck/vim-coffee-script.git
git://github.com/altercation/vim-colors-solarized.git
git://github.com/vim-scripts/Color-Sampler-Pack.git
git://github.com/godlygeek/tabular.git
git://github.com/tomtom/tcomment_vim.git
git://github.com/msanders/snipmate.vim.git
git://github.com/tpope/vim-cucumber.git
git://github.com/nono/vim-handlebars.git
git://github.com/tpope/vim-fugitive.git
git://github.com/tpope/vim-eunuch.git
```

---

The pathogen config is as follows:

```vim
runtime! autoload/pathogen.vim
silent! call pathogen#infect()
silent! call pathogen#infect("~/src/vim/bundle")

" auto-generate doc for each plugin in pathogen runtime path
call pathogen#helptags()
```

`'runtimepath'` include `~/src/vim/bundle` too. This is where I store
custom-made plugins, eg. these are mine as I'm trying to learn how to build my
own Vim plugins.

Also documentation for plugins is generated, `pathogen#helptags()` is called
directly from there.

### Some notes

* `vim/bundle` may include growing custom made package. These are vim plugins
  that have not their own github repo.

* `vim/plugin` may include tiny vim script or plugin. These are just non
  pathogen-bundled, vim scripts put there.

---

`plugin/t.vim` is a minimalist vim template plugin thing. Heavily based on
https://github.com/tpope/tpope/blob/master/.vim/plugin/ztemplate.vim.

```vim
" Custom templates
" http://vim.runpaint.org/typing/using-templates/
"
" Mustache like template placeholdr: eg. {{ title }}
"
" Some functions borrowed to:
"
" > https://github.com/tpope/tpope/blob/master/.vim/plugin/ztemplate.vim
" > (amazsing tiny template plugin)
"
" When editing a new file (not created yet, eg. BufNewFile is triggered), the "
" plugin will try to load a template from ~/vim/templates with the exact same
" name, " or try to fallback to `skel.{ext}`
"
```

Right now, there are templates for:

* package.json:
a basic npm package.json file.

* gherkin feature:
same here, every time a new `*.feature` file is created,
this template is loaded in the current buffer.

* `*.html` files:
always based on HTML5 Boilerplate index.html file (unstripped, might switch to
the unstriped version)

* `*.vim` files: a basic boilerplate for vim script files.

Each template has some placeholder in it. `<C-P>` (ctrl+p) or `<D-Space>`
(cmd+space, mac only) may be used to jump to next `{{ thing }}`.

---

The `boilerplate` directory here includes a basic starting point for creating new plugin.

I might add a bash or node script (maybe a grunt init task) to replace these
`{{ mustache-like }}` things, and rename files appropriately.

