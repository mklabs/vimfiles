" {{ filename }} -  {{ description }}
" Maintainer:       {{ author }}

if exists("g:loaded_{{ basename }}") || v:version < 700 || &cp
  finish
endif
let g:loaded_{{ basename }} = 1

"
" Fun things start here
"



" vim:set sw=2 sts=2:

