syntax on
set nocompatible
set ruler
set ignorecase
set smartcase
set incsearch
set wrap
set linebreak
set nolist
set wrapmargin=0
set modeline
set wildmenu

" Allow code folding
set foldmethod=indent
set foldlevel=99
set encoding=utf-8

" Add visual column
set colorcolumn=+1

" Set indentation for Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Make Python code look pretty
let python_highlight_all=1

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
" For this to work you need to have pyflakes installed
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'
call plug#end()
