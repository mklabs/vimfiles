"
" ~ shady
"
"     a vim colorscheme, by cloudhead
"
"  To be used with the following syntax files:
"
"    JavaScript - <http://www.vim.org/scripts/script.php?script_id=1491>
"    C          - <http://www.vim.org/scripts/script.php?script_id=234>
"
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "shady"

" General colors
hi Normal               ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi NonText              ctermfg=black       ctermbg=NONE        cterm=NONE

hi Cursor               ctermfg=black       ctermbg=white       cterm=reverse
hi LineNr               ctermfg=235         ctermbg=NONE        cterm=NONE

hi VertSplit            ctermfg=236         ctermbg=NONE        cterm=NONE
hi StatusLine           ctermfg=238         ctermbg=NONE        cterm=NONE
hi StatusLineNC         ctermfg=236         ctermbg=NONE        cterm=NONE

hi Folded               ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Title                ctermfg=NONE        ctermbg=NONE        cterm=BOLD
hi Visual               ctermfg=NONE        ctermbg=52          cterm=NONE

hi SpecialKey           ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi WildMenu             ctermfg=black       ctermbg=yellow      cterm=NONE
hi PmenuSbar            ctermfg=black       ctermbg=white       cterm=NONE

hi Error                ctermfg=NONE        ctermbg=red         cterm=NONE
hi ErrorMsg             ctermfg=NONE        ctermbg=52          cterm=NONE
hi WarningMsg           ctermfg=NONE        ctermbg=172         cterm=NONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg              ctermfg=238         ctermbg=NONE        cterm=bold

if version >= 700 " Vim 7.x specific colors
  hi CursorLine         ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi CursorColumn       ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi TabLine            ctermfg=238         ctermbg=NONE        cterm=NONE
  hi TabLineFill        ctermfg=238         ctermbg=NONE        cterm=NONE
  hi TabLineSel         ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi MatchParen         ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi Pmenu              ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi PmenuSel           ctermfg=black       ctermbg=yellow      cterm=NONE
  hi Search             ctermfg=yellow      ctermbg=NONE        cterm=REVERSE
endif

" Syntax highlighting
hi Comment              ctermfg=238        ctermbg=NONE        cterm=NONE
hi String               ctermfg=245        ctermbg=NONE        cterm=NONE
hi Number               ctermfg=193        ctermbg=NONE        cterm=NONE
hi Character            ctermfg=red        ctermbg=NONE        cterm=NONE
hi PreProc              ctermfg=194        ctermbg=NONE        cterm=NONE

hi Keyword              ctermfg=white       ctermbg=NONE       cterm=BOLD
hi Statement            ctermfg=white       ctermbg=NONE       cterm=BOLD
hi Conditional          ctermfg=white       ctermbg=NONE       cterm=BOLD

hi Todo                 ctermfg=240         ctermbg=NONE       cterm=BOLD
hi Constant             ctermfg=white       ctermbg=NONE       cterm=BOLD

hi Identifier           ctermfg=109         ctermbg=NONE       cterm=NONE
hi Function             ctermfg=109         ctermbg=NONE       cterm=NONE
hi Class                ctermfg=109         ctermbg=NONE       cterm=NONE
hi Type                 ctermfg=109         ctermbg=NONE       cterm=BOLD
hi Label                ctermfg=yellow      ctermbg=NONE       cterm=NONE

hi Special              ctermfg=red         ctermbg=NONE       cterm=NONE
hi Delimiter            ctermfg=cyan        ctermbg=NONE       cterm=NONE

hi cIdentifier          ctermfg=255         ctermbg=NONE       cterm=NONE
hi cFunction            ctermfg=109         ctermbg=NONE       cterm=NONE
hi cStorageClass        ctermfg=255         ctermbg=NONE       cterm=BOLD
hi cOperator            ctermfg=109         ctermbg=NONE       cterm=BOLD
hi cPointerOperator     ctermfg=244         ctermbg=NONE       cterm=NONE
hi cPreProc             ctermfg=240         ctermbg=NONE       cterm=BOLD

" Pandoc
hi pdcCodeBlock         ctermfg=246         ctermbg=232        cterm=NONE
hi pdcEmphasis	        ctermfg=NONE	      ctermbg=NONE       cterm=ITALIC
hi pdcStrong  	        ctermfg=NONE	      ctermbg=NONE       cterm=BOLD
hi pdcBlockquote  	    ctermfg=109	        ctermbg=NONE       cterm=ITALIC

hi link pdcCode pdcCodeBlock

" C
hi link cMacro          cIdentifier
hi link cOctalZero      Number
hi link cInclude        cPreProc
hi link cDefine         cPreProc
hi link cPreCondit      cPreProc

hi link Conditional     Keyword
hi link Statement       Normal
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Keyword
hi link Structure       Keyword
hi link Typedef         Type
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

" Javascript
hi link javaScriptNumber         Number
hi link javaScriptPrototype      Type    " prototype
hi link javaScriptIdentifier     Identifier " var this
hi link javaScriptType           Type    " const undefined void yield 
hi link javaScriptFunction       Keyword " function
hi link javaScriptRegexpString   Number  " function
hi link javaScriptSource         Keyword " import export
hi link javaScriptOperator       Keyword " delete new in instanceof let typeof
hi link javaScriptBoolean        Keyword " true false
hi link javaScriptNull           Keyword " null
hi link javaScriptLabel          Label   " length:
hi link javaScriptConditional    Keyword " if else
hi link javaScriptRepeat         Keyword " do while for
hi link javaScriptBranch         Keyword " break continue switch case default return
hi link javaScriptStatement      Keyword " try catch throw with finally
hi link javaScriptGlobalObjects  Class   " Array Boolean Date Function Infinity JavaArray JavaClass JavaObject JavaPackage Math Number NaN Object Packages RegExp String Undefined java netscape sun

" Shell
hi shCommandSub	    	ctermfg=white
hi link shOperator 		String
hi link shDeref   		Identifier

