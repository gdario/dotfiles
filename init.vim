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

" Set general indentation
set tabstop=4
set shiftwidth=4
set expandtab

" Set R code indentation to 2 spaces
autocmd FileType r setlocal sw=2

" Set indentation for Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

call plug#begin('~/.vim/plugged')
Plug 'jalvesaq/Nvim-R'
Plug 'maverickg/stan.vim'
Plug 'dense-analysis/ALE'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()
let g:deoplete#enable_at_startup = 1
