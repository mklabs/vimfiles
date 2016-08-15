" Basic neomake configuration for es6 with eslint, jsonlint for json files
let g:neomake_javascript_eslint_maker = {
\ 'args': ['--env', 'es6', '-f', 'compact'],
\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m'
\ }

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_json_enabled_makers = ['jsonlint']

" Run neomake on save for js/json files
autocmd! BufWritePost *.js Neomake
autocmd! BufWritePost *.json Neomake
