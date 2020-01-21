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
" set colorcolumn=+1

" Set general indentation
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.vim/plugged')
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dense-analysis/ALE'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()
let g:deoplete#enable_at_startup = 1
