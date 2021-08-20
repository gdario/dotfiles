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

syntax on
filetype indent plugin on

" Allow code folding
set foldmethod=indent
set foldlevel=99

" Add visual column
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

" Set general indentation
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Don't replace tabs with spaces in Makefiles
autocmd FileType make set noexpandtab

" Set R code indentation to 2 spaces
autocmd FileType r setlocal sw=2

" Set up Netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

" Search down into subfolders - tab complete file-related tasks
set path+=**

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
Plug 'jalvesaq/Nvim-R'
call plug#end()
