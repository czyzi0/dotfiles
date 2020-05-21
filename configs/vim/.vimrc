"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" vim-airline
Plug 'https://github.com/vim-airline/vim-airline'

" vim-polyglot
Plug 'https://github.com/sheerun/vim-polyglot'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax
syntax on
filetype indent plugin on

" Color scheme
colorscheme scheme

" Show linenumbers
set number

" Allow mouse usage
set mouse=a

" Do not wrap lines
set nowrap

" The width of a TAB is set to 4
set tabstop=4

" Indents will have a width of 4
set shiftwidth=4

" Sets the number of columns for a TAB
set softtabstop=4

" Highlight cursorline
" set cursorline

" Expand TABs to spaces
set expandtab

" Show whitespaces
set listchars=eol:¬,space:·,tab:→\ 
set list

" Encoding
set encoding=utf-8

" Rulers
set colorcolumn=79,100

" Copy to system clipboard
set clipboard=unnamedplus

" Set fillchars (prettier editor)
set fillchars=vert:│


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Theme
let g:airline_theme='scheme'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show highlighting groups for current word
nmap <C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
