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

" Don't replace tabs with spaces in Makefiles
autocmd FileType make set noexpandtab

call plug#begin('~/.vim/plugged')
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dense-analysis/ALE'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
call plug#end()
let g:deoplete#enable_at_startup = 1

" From https://github.com/deoplete-plugins/deoplete-jedi/issues/35#issuecomment-281791696
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1

" Unite/ref and pydoc are more useful.
let g:jedi#documentation_command = '<Leader>_K'
let g:jedi#auto_close_doc = 1
