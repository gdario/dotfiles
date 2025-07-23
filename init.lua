-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
-- vim.opt.spelllang = "en_gb"

-- Leader key
vim.g.mapleader = ","

-- Use nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Use system clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Display settings
vim.opt.termguicolors = true
-- vim.o.background = "dark" -- or "light"

-- Scrolling and UI settings
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
-- vim.opt.sidescrolloff = 8

-- Title
vim.opt.title = true
vim.opt.titlestring = "nvim"

-- Indentation
vim.opt.tabstop = 8
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search configuration
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- Open new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- LSP
-- vim.lsp.inlay_hint.enable(true)

-- Plugins
local plugins = {
--   { "nvim-lua/plenary.nvim" },
--   { "nvim-tree/nvim-web-devicons" },
--   { "ellisonleao/gruvbox.nvim" },
--   { "nvim-lualine/lualine.nvim" },
--   { "nvim-tree/nvim-tree.lua" },
--   { "nvim-telescope/telescope.nvim" },
--   { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "shaunsingh/solarized.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "mason-org/mason.nvim" },
  { "neovim/nvim-lspconfig" },
  { "mason-org/mason-lspconfig.nvim" },
  { "stevearc/conform.nvim", opts = {} },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins)

vim.cmd.colorscheme("catppuccin")
-- require("lualine").setup()
-- require("nvim-tree").setup()
-- require("telescope").setup()

-- Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "r", "rust", "c" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true, },
})
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Mason & LSP
require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "pylsp" } })

require("conform").setup({
  default_format_opts = { lsp_format = "fallback" },
})

