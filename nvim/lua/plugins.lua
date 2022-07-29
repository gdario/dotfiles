return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

end)

