" Case independent searches
set ignorecase
set smartcase

" Folding
set foldmethod=indent
set foldlevel=99

" Set default encoding
set encoding=utf-8

" Add delimiting colorbar
set colorcolumn=+1

" Add PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-scripts/indentpython.vim'
call plug#end()
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#server_timeout = 40
" let g:deoplete#sources#jedi#show_docstring = 0
