vim-boilerplate
===============

**A simple (kindof) boilerplate for bootstraping new vim plugins**

- cli script to generate a new plugin from this boilerplate template

Should definitely be usable as a standalone thing, integration with grunt init
templates would be nice.

Promps for each `{{ placeholder }}` values. Init sane defaults for some
of them (user === `git config --global github.user`, name === `dirname`).

Install
-------

Clone the repo locally, cd to this directory, and run `npm link`.

Usage
-----

```
Usage: vim-boilerplate [options]

  -h, --help      Show this help text
  -v, --version   Display package version

And follow the prompts
```

The script must be run from within an empty directory, otherwise a warning is raised.

Every template files in the `templates/default` directory (I might add other template,
for now only one `default` template available), is copied to the current
working directory and processed through [Hogan][] with the prompt values.

```sh
$ ~/test/foooo  vim-boilerplate
... Generating from default template ...
name: (foooo)
Plugin description: Woot this is foo and Blah!
author: (mklabs)
... Copy autload/foooo.vim ...
... Copy doc/foooo.txt ...
... Copy package.json ...
... Copy plugin/foooo.vim ...
... Copy readme.md ...
... All done ...

$ ~/test/foooo  ls -R
autload/      doc/          package.json  plugin/       readme.md

./autload:
foooo.vim

./doc:
foooo.txt

./plugin:
foooo.vim
$ ~/test/foooo
```

[Hogan]: http://twitter.github.com/hogan.js/

---

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


