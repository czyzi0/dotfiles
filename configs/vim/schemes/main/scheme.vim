set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "scheme"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" blue             33
" dark-grey        236
" grey             240
" green            40
" light-blue       51
" orange           202
" red              160
" purple           98
" white            255
" yellow           220
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Editor
hi LineNr                              ctermfg=240    ctermbg=NONE   cterm=NONE
hi Cursor                              ctermfg=NONE   ctermbg=NONE   cterm=NONE
hi CursorLine                          ctermfg=NONE   ctermbg=233    cterm=NONE
hi NonText                             ctermfg=236    ctermbg=NONE   cterm=NONE
hi SpecialKey                          ctermfg=236    ctermbg=NONE   cterm=NONE
hi ColorColumn                         ctermfg=NONE   ctermbg=233    cterm=NONE
hi PMenuSbar                           ctermfg=NONE   ctermbg=240    cterm=NONE
hi PMenuThumb                          ctermfg=NONE   ctermbg=255    cterm=NONE
hi PMenu                               ctermfg=255    ctermbg=240    cterm=NONE
hi PMenuSel                            ctermfg=221    ctermbg=33     cterm=NONE
hi Search                              ctermfg=NONE   ctermbg=255    cterm=NONE
hi cursorim                            ctermfg=240    ctermbg=NONE   cterm=NONE
hi StorageClass                        ctermfg=255    ctermbg=NONE   cterm=NONE
hi VertSplit                           ctermfg=236    ctermbg=NONE   cterm=NONE

" Common Syntax
hi Normal                              ctermfg=255    ctermbg=NONE   cterm=NONE
hi Typedef                             ctermfg=255    ctermbg=NONE   cterm=NONE
hi Include                             ctermfg=221    ctermbg=NONE   cterm=NONE
hi Identifier                          ctermfg=160    ctermbg=NONE   cterm=NONE
hi Conditional                         ctermfg=160    ctermbg=NONE   cterm=NONE
hi Special                             ctermfg=98     ctermbg=NONE   cterm=NONE
hi Label                               ctermfg=255    ctermbg=NONE   cterm=NONE
hi Statement                           ctermfg=33     ctermbg=NONE   cterm=NONE
hi Comment                             ctermfg=240    ctermbg=NONE   cterm=NONE
hi Character                           ctermfg=221    ctermbg=NONE   cterm=NONE
hi Number                              ctermfg=98     ctermbg=NONE   cterm=NONE
hi Boolean                             ctermfg=98     ctermbg=NONE   cterm=NONE
hi Operator                            ctermfg=160    ctermbg=NONE   cterm=NONE
hi Define                              ctermfg=202    ctermbg=NONE   cterm=NONE
hi Function                            ctermfg=40     ctermbg=NONE   cterm=NONE
hi PreProc                             ctermfg=160    ctermbg=NONE   cterm=NONE
hi Exception                           ctermfg=255    ctermbg=NONE   cterm=NONE
hi Keyword                             ctermfg=202    ctermbg=NONE   cterm=NONE
hi Type                                ctermfg=255    ctermbg=NONE   cterm=NONE
hi Constant                            ctermfg=98     ctermbg=NONE   cterm=NONE
hi String                              ctermfg=221    ctermbg=NONE   cterm=NONE
hi Repeat                              ctermfg=160    ctermbg=NONE   cterm=NONE
hi Structure                           ctermfg=255    ctermbg=NONE   cterm=NONE
hi Todo                                ctermfg=160    ctermbg=NONE   cterm=NONE

" Python
hi pythonImport                        ctermfg=33     ctermbg=NONE   cterm=NONE
hi pythonNone                          ctermfg=98     ctermbg=NONE   cterm=NONE
hi pythonBuiltinFunc                   ctermfg=51     ctermbg=NONE   cterm=NONE
hi pythonBuiltinObj                    ctermfg=51     ctermbg=NONE   cterm=NONE
hi pythonClassVar                      ctermfg=202    ctermbg=NONE   cterm=NONE
hi pythonDecorator                     ctermfg=160    ctermbg=NONE   cterm=NONE
hi pythonDottedName                    ctermfg=51     ctermbg=NONE   cterm=NONE
hi pythonExClass                       ctermfg=51     ctermbg=NONE   cterm=NONE
hi pythonException                     ctermfg=160    ctermbg=NONE   cterm=NONE
hi pythonRun                           ctermfg=240    ctermbg=NONE   cterm=NONE

" Bash
hi bashStatement                       ctermfg=255    ctermbg=NONE   cterm=NONE
hi shEcho                              ctermfg=255    ctermbg=NONE   cterm=NONE
hi shFunctionKey                       ctermfg=33     ctermbg=NONE   cterm=NONE 
hi shOption                            ctermfg=255    ctermbg=NONE   cterm=NONE
hi shQuote                             ctermfg=220    ctermbg=NONE   cterm=NONE
hi shStatement                         ctermfg=255    ctermbg=NONE   cterm=NONE
hi shVariable                          ctermfg=255    ctermbg=NONE   cterm=NONE

" JavaScript
hi jsFunction                          ctermfg=33     ctermbg=NONE   cterm=NONE
hi jsFuncName                          ctermfg=40     ctermbg=NONE   cterm=NONE
hi jsFuncParens                        ctermfg=255    ctermbg=NONE   cterm=NONE
hi jsFuncBraces                        ctermfg=255    ctermbg=NONE   cterm=NONE
hi jsFuncCall                          ctermfg=40     ctermbg=NONE   cterm=NONE
hi jsParens                            ctermfg=255    ctermbg=NONE   cterm=NONE
hi jsNoise                             ctermfg=255    ctermbg=NONE   cterm=NONE
hi jsStorageClass                      ctermfg=33     ctermbg=NONE   cterm=NONE
hi jsFuncArgs                          ctermfg=202    ctermbg=NONE   cterm=NONE
hi jsReturn                            ctermfg=160    ctermbg=NONE   cterm=NONE
hi jsGlobalObjects                     ctermfg=51     ctermbg=NONE   cterm=NONE
hi jsThis                              ctermfg=202    ctermbg=NONE   cterm=NONE
hi jsPrototype                         ctermfg=51     ctermbg=NONE   cterm=NONE
hi jsObjectProp                        ctermfg=255    ctermbg=NONE   cterm=NONE

" Markdown
hi htmlH1                              ctermfg=40     ctermbg=NONE   cterm=NONE
hi htmlBold                            ctermfg=51     ctermbg=NONE   cterm=NONE
hi htmlItalic                          ctermfg=51     ctermbg=NONE   cterm=NONE
hi mkdBold                             ctermfg=51     ctermbg=NONE   cterm=NONE
hi mkdCode                             ctermfg=202    ctermbg=NONE   cterm=NONE
hi mkdListItem                         ctermfg=160    ctermbg=NONE   cterm=NONE
hi mkdListItemLine                     ctermfg=220    ctermbg=NONE   cterm=NONE
hi mkdURL                              ctermfg=33     ctermbg=NONE   cterm=underline
hi mkdLinkDefTarget                    ctermfg=33     ctermbg=NONE   cterm=underline
hi mkdDelimiter                        ctermfg=255    ctermbg=NONE   cterm=NONE
hi mkdLink                             ctermfg=220    ctermbg=NONE   cterm=NONE
hi mkdLinkDef                          ctermfg=98     ctermbg=NONE   cterm=NONE
hi mkdID                               ctermfg=98     ctermbg=NONE   cterm=NONE
hi mkdBlockQuote                       ctermfg=160    ctermbg=NONE   cterm=NONE

" HTML
hi htmlTagN                            ctermfg=255    ctermbg=NONE   cterm=NONE
hi htmlTag                             ctermfg=255    ctermbg=NONE   cterm=NONE
hi htmlEndTag                          ctermfg=255    ctermbg=NONE   cterm=NONE
hi htmlTagName                         ctermfg=160    ctermbg=NONE   cterm=NONE
hi htmlSpecialTagName                  ctermfg=160    ctermbg=NONE   cterm=NONE
hi htmlArg                             ctermfg=40     ctermbg=NONE   cterm=NONE
