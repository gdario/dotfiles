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
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set colorcolumn=+1
set wildmenu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'jalvesaq/Nvim-R'
call plug#end()
let g:deoplete#enable_at_startup = 1

