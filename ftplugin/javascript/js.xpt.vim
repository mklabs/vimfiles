" Thanks to Torgeir Thoresen vim personal files
"
" https://github.com/torgeir/vim/blob/master/snippets/ftplugin/javascript/javascript.xpt.vim

XPTemplate priority=lang-1

XPT : " js key:value pair
`key^: `value^`...^,
`key^: `value^`...^


XPT info " js console.info
console.info(`cursor^);


XPT log " js console.log
console.log(`cursor^);

XPT l " js console.log
console.log(`cursor^);


XPT warn " js console.warn
console.warn(`cursor^);


XPT error " js console.err
console.error(`cursor^);


XPT ex " js bdd expect
expect(`obj^).to`Equal^(`^);

XPT jsdoc " js doc comment
/**
 * `Block description^
 *
 * @param {`type^} `name^ - `parameter description^`...^
* @param {`type^} `name^ - `parameter description^`...^
 */
