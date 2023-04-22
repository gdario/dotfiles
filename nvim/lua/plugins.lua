return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'eigenfoo/stan-vim'
    use 'preservim/vim-markdown'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'neovim/nvim-lspconfig'
end)
