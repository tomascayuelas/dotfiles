local fn = vim.fn
local utils = require 'amika.utils'

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
  -- Have packer manage itself
  use 'wbthomason/packer.nvim'

  -- ================================================================
  -- Lua Utils
  -- ================================================================
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins


  -- ================================================================
  -- Improve startup time && fixes
  -- ================================================================
  use {
    -- https://github.com/lewis6991/impatient.lua
    'lewis6991/impatient.nvim'
  }


  -- ================================================================
  -- User Interface
  -- ================================================================
  use {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons'
  }

  use {
    -- https://github.com/goolord/alpha-nvim
    'goolord/alpha-nvim'
  }

  use {
    -- https://github.com/nvim-lualine/lualine.nvim
    'nvim-lualine/lualine.nvim'
  }
  
  use {
    -- https://github.com/folke/which-key.nvim
    'folke/which-key.nvim',
  }


  -- ================================================================
  -- Coding
  -- ================================================================
  use {
    -- https://github.com/windwp/nvim-autopairs
    'windwp/nvim-autopairs'
  }

  use {
    -- https://github.com/norcalli/nvim-colorizer.lua
    'norcalli/nvim-colorizer.lua'
  }

  use {
    -- https://github.com/numToStr/Comment.nvim
    'numToStr/Comment.nvim'
  }

  use {
    -- Integration with treesitter commentstring option
    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    'JoosepAlviste/nvim-ts-context-commentstring'
  }

  use {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    'lukas-reineke/indent-blankline.nvim'
  }


  -- ================================================================
  -- Buffers
  -- ================================================================
  --  use "moll/vim-bbye" -- https://github.com/moll/vim-bbye


  -- ================================================================
  -- File Explorer
  -- ================================================================
  use {
    -- https://github.com/nvim-tree/nvim-tree.lua
    'nvim-tree/nvim-tree.lua'
  }


  -- ================================================================
  -- Terminal
  -- ================================================================
  -- https://github.com/akinsho/toggleterm.nvim
  use {
    'akinsho/toggleterm.nvim'
  }


  -- ================================================================
  -- Keymaps
  -- ================================================================
  --  use 'folke/which-key.nvim' -- https://github.com/folke/which-key.nvim


  -- ================================================================
  -- Colorschemes
  -- ================================================================
  -- https://github.com/catppuccin/nvim
  use {
    'catppuccin/nvim',
    as = 'catppuccin'
  }

  -- https://github.com/NLKNguyen/papercolor-theme
  use {
    'NLKNguyen/papercolor-theme'
  }
  --  use "folke/tokyonight.nvim" -- https://github.com/folke/tokyonight.nvim


  -- ================================================================
  -- Language Server Protocol (LSP) stuff
  -- ================================================================
  -- https://github.com/williamboman/mason.nvim
  -- LSP: `lspconfig` & `mason-lspconfig.nvim`
  -- DAP: `nvim-dap`
  -- Linters: `null-ls.nvim` or `nvim-lint`
  -- Formatters: `null-ls.nvim` or `formatter.nvim`
  use {
    'williamboman/mason.nvim',
    run = ':MasonUpdate'
  }

  -- https://github.com/williamboman/mason-lspconfig.nvim
  use {
    'williamboman/mason-lspconfig.nvim'
  }

  -- https://github.com/neovim/nvim-lspconfig
  use {
    'neovim/nvim-lspconfig'
  }

  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  -- for formatters and linters
  use {
    'jose-elias-alvarez/null-ls.nvim'
  }

  -- https://github.com/jay-babu/mason-null-ls.nvim
  use {
    'jay-babu/mason-null-ls.nvim'
  }

  -- https://github.com/mfussenegger/nvim-dap
  use {
    'mfussenegger/nvim-dap'
  }

  --  use "scalameta/nvim-metals" -- https://github.com/scalameta/metals
  --  use "rcarriga/nvim-dap-ui" -- https://github.com/rcarriga/nvim-dap-ui

  -- ================================================================
  -- Completion engines and Snippets
  -- ================================================================
  -- https://github.com/hrsh7th/nvim-cmp
  use {
    'hrsh7th/nvim-cmp'
  }

  -- https://github.com/hrsh7th/cmp-buffer
  use {
    'hrsh7th/cmp-buffer'
  }

  -- https://github.com/hrsh7th/cmp-path
  use {
    'hrsh7th/cmp-path'
  }

  -- https://github.com/hrsh7th/cmp-cmdline
  use {
    'hrsh7th/cmp-cmdline'
  }

  -- https://github.com/hrsh7th/cmp-nvim-lsp
  use {
    'hrsh7th/cmp-nvim-lsp'
  }

  -- https://github.com/L3MON4D3/LuaSnip
  use {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    tag = 'v1.2.1', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  }

  -- https://github.com/saadparwaiz1/cmp_luasnip
  use {
    'saadparwaiz1/cmp_luasnip'
  }

  -- https://github.com/rafamadriz/friendly-snippets
  use {
    'rafamadriz/friendly-snippets'
  }

  -- https://github.com/onsails/lspkind-nvim
  use {
    'onsails/lspkind-nvim'
  }

  -- ================================================================
  -- Telescope
  -- ================================================================
  use {
    -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0'
  }

  use {
    -- https://github.com/nvim-telescope/telescope-fzf-native.nvim 
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
  }

  -- https://github.com/ahmedkhalf/project.nvim
  use {
    'ahmedkhalf/project.nvim'
  }

  -- ================================================================
  -- Treesitter
  -- ================================================================
  use {
    -- https://github.com/nvim-treesitter/nvim-treesitter 
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }


--  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- ================================================================
  -- Version Control System - GIT
  -- ================================================================
  -- https://github.com/lewis6991/gitsigns.nvim
  use {
    'lewis6991/gitsigns.nvim'
  }

  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
