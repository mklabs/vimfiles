
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec, file_rec/async, file_rec/neovim', 'ignore_pattern', 'node_modules')
:"
" Set "-no-quit" automatically in grep unite source.
call unite#custom#profile('source/grep', 'context', {
\ 'no_quit' : 1
\ })

" Ctrl-{key} to fuzzy find stuff
map <C-p> :Unite -start-insert -direction=botright -winheight=10 file/async file_rec/async<CR>
map <C-b> :Unite -start-insert -direction=botright -winheight=10 buffer<CR>
map <C-g> :Unite -start-insert -direction=botright -winheight=10 file_rec/git<CR>
map <C-o> :Unite -start-insert -direction=topleft -winwidth=40 -vertical outline<CR>


