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
set encoding=utf-8

" Required by Netrw
filetype plugin on

" Allow code folding
set foldmethod=indent
set foldlevel=99

" Add visual column
" set colorcolumn=80

" Set general indentation
set tabstop=4
set shiftwidth=4
set expandtab

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
" autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType make set noexpandtab

" Set R code indentation to 2 spaces
autocmd FileType r setlocal sw=2

" Don't replace tabs with spaces in Makefiles
autocmd FileType make set noexpandtab

" Make Python code look pretty
let python_highlight_all=1

"Jedi-vim options
let g:jedi#popup_on_dot = 0

call plug#begin('~/.vim/plugged')
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'
" syntastic requires autopep8 or pylint
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
" To use vim-markdown you must install tabular
" tabular must come before vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()
