
" Thanks to Torgeir Thoresen vim personal files
"
" https://github.com/torgeir/vim/blob/master/snippets/ftplugin/javascript/javascript.xpt.vim

XPTemplate priority=lang-1

XPT test " ava test
test(`do what^, t => {
  `cursor^
});

XPT tp " ava t.plan
t.plan(`how many^);

XPT ti " ava t.is
t.is(`actual^, `expected^)
