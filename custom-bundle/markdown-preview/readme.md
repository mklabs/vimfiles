
vim-mp.vim
==========

**Quick and Dirty "view my markdown" thing**

Install
-------

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/mklabs/vim-mp.git

Once help tags have been generated, you can view the manual with
`:help vim-mp`

Commands
--------

`:MarkdownPreview`

buffer command only available when `ft=markdown`. Trigger this command
to automatically compile down the current markdown file through
[marked](https://github.com/chjj/marked), with GitHub readme like
styling, and open the generated file into the default web browser.

Configuration
-------------

> tbd

- provide hooks for
  - browser command (open on darwin, start on windows,
  google-chrome everywhere else)
  - template used

- watch / reload thing

