local fn = vim.fn
local utils = require("amika.utils")

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local packer = utils.load("packer")

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Utils
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- UI
  use "goolord/alpha-nvim" -- https://github.com/goolord/alpha-nvim
  use "rcarriga/nvim-notify" -- https://github.com/rcarriga/nvim-notify
  use "kyazdani42/nvim-web-devicons" -- https://github.com/kyazdani42/nvim-web-devicons
  use "nvim-lualine/lualine.nvim" -- https://github.com/nvim-lualine/lualine.nvim
  use "stevearc/dressing.nvim" -- https://github.com/stevearc/dressing.nvim
  use "max397574/better-escape.nvim" -- https://github.com/max397574/better-escape.nvim

  -- Improve startup time && fixes
  use "lewis6991/impatient.nvim" -- https://github.com/lewis6991/impatient.nvim
  use "antoinemadec/FixCursorHold.nvim" -- https://github.com/antoinemadec/FixCursorHold.nvim

  -- Coding
  use "windwp/nvim-autopairs" -- https://github.com/windwp/nvim-autopairs
  use "numToStr/Comment.nvim" -- https://github.com/numToStr/Comment.nvim
  use "lukas-reineke/indent-blankline.nvim" -- https://github.com/lukas-reineke/indent-blankline.nvim
  use "AckslD/nvim-neoclip.lua" -- https://github.com/AckslD/nvim-neoclip.lua
  use "norcalli/nvim-colorizer.lua" -- https://github.com/norcalli/nvim-colorizer.lua

  -- Buffers
  use "moll/vim-bbye" -- https://github.com/moll/vim-bbye

  -- File Explorer
  use "kyazdani42/nvim-tree.lua" -- https://github.com/kyazdani42/nvim-tree.lua

  -- Project Management
  use "ahmedkhalf/project.nvim" -- https://github.com/ahmedkhalf/project.nvim

  -- Terminal
  use "akinsho/toggleterm.nvim" -- https://github.com/akinsho/toggleterm.nvim

  -- Keymaps
  use 'folke/which-key.nvim' -- https://github.com/folke/which-key.nvim

  -- Colorschemes
  use "folke/tokyonight.nvim" -- https://github.com/folke/tokyonight.nvim

  -- Snippets
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP stuff
  use "williamboman/mason.nvim"             -- https://github.com/williamboman/mason.nvim
  use "williamboman/mason-lspconfig.nvim"   -- https://github.com/williamboman/mason-lspconfig.nvim 
  use "neovim/nvim-lspconfig"               -- https://github.com/neovim/nvim-lspconfig
  use "jose-elias-alvarez/null-ls.nvim"     -- for formatters and linters
--  use "scalameta/nvim-metals" -- https://github.com/scalameta/metals
  use "onsails/lspkind-nvim" -- https://github.com/onsails/lspkind-nvim
  use "mfussenegger/nvim-dap" -- https://github.com/mfussenegger/nvim-dap
--  use "rcarriga/nvim-dap-ui" -- https://github.com/rcarriga/nvim-dap-ui

  -- CMP utils and Snippets
  use "hrsh7th/nvim-cmp"                                -- https://github.com/hrsh7th/nvim-cmp
  use "hrsh7th/cmp-buffer"                              -- buffer completions
  use "hrsh7th/cmp-path"                                -- path completions
  use "hrsh7th/cmp-cmdline"                             -- cmdline completions
  use({"L3MON4D3/LuaSnip", tag = "v.<CurrentMajor>.*"}) -- https://github.com/L3MON4D3/LuaSnip
  use "saadparwaiz1/cmp_luasnip"                        -- https://github.com/saadparwaiz1/cmp_luasnip
  use "hrsh7th/cmp-nvim-lsp"                            -- https://github.com/hrsh7th/cmp-nvim-lsp
  use "rafamadriz/friendly-snippets"                    -- https://github.com/rafamadriz/friendly-snippets

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- https://github.com/nvim-telescope/telescope.nvim
  use "nvim-telescope/telescope-project.nvim" -- https://github.com/nvim-telescope/telescope-project.nvim
  use "nvim-telescope/telescope-frecency.nvim" -- https://github.com/nvim-telescope/telescope-frecency.nvim

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
