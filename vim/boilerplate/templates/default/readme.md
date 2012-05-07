
{{ name }}.vim
==============

**{{ description }}**

Reads some good documentation on how to write your plugin.

- http://stevelosh.com/blog/2011/09/writing-vim-plugins/
- http://learnvimscriptthehardway.stevelosh.com/
- Use your Github buddy, reading through other people source is a really
  effective way to lear vim scripts (and pretty much any thing else)

Also, probably your best source of documentation may very well remain
the vim documentation itself. See:

- `:h plugin`
- `:h write-plugin`
- `:h plugin-details`
- `:h autoload`
- `:h write-local-help`

Install
-------

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/{{ user }}/vim-{{ name }}.git

Once help tags have been generated, you can view the manual with
`:help {{ name }}`


Commands
--------

If your plugin defines some command. Add a brief description here, for
each of these.

Configuration
-------------

If your plugin has some kind of configuration. Detail this here.


License & Acknowledgement
-------------------------

Add credits here

License: Same as Vim. See `:help license`.


