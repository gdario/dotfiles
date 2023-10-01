set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require('plugins')
lua require('init')
lua require('lsp_config')
