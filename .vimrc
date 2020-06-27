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
set encoding=utf-8

syntax on
filetype indent plugin on

" Allow code folding
set foldmethod=indent
set foldlevel=99

" Add visual column
set colorcolumn=+1

" Set general indentation
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Don't replace tabs with spaces in Makefiles
autocmd FileType make set noexpandtab

" Set R code indentation to 2 spaces
autocmd FileType r setlocal sw=2
