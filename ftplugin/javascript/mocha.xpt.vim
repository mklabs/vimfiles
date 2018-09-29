
" Thanks to Torgeir Thoresen vim personal files
"
" https://github.com/torgeir/vim/blob/master/snippets/ftplugin/javascript/javascript.xpt.vim

XPTemplate priority=lang-1

XPT after " js bdd after
after((`done^) => {
  `cursor^
});


XPT before " js bdd before
before((`done^) => {
  `cursor^
});


XPT desc " js bdd describe
describe('`a piece of functionality^', () => {
  `cursor^
});

XPT describe " js bdd describe
describe('`a piece of functionality^', () => {
  `cursor^
});

XPT it " js bdd it
it('`does what^', (`done^) => {
  `cursor^
});

XPT itp " js bdd pending it
it('`does what^');
