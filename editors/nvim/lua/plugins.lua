return require'packer'.startup(function(use)
  use({ "wbthomason/packer.nvim", opt = true })

  -------------------------------------
  --          FILE MANAGERS
  -------------------------------------
  use({'kyazdani42/nvim-tree.lua',
    config = function()
      require("settings/plugins/nvim-tree")
    end,
  })

  use({'nvim-telescope/telescope.nvim',
    config = function()
      require("settings/plugins/telescope").setup()
    end,
    requires = {
      'fannheyward/telescope-coc.nvim'
    }
  })

  ---------------------------------------
  --            EDITOR
  ---------------------------------------
  -- auto pair brackets
  use({ 'jiangmiao/auto-pairs' })

  -- handle pairs of text objects
  use({ 'tpope/vim-surround' })

  -- markdown preview
  use({ 'ellisonleao/glow.nvim' })

  -- inline search guide motion movements
  use({ 'phaazon/hop.nvim',
    config = function()
      require("settings/plugins/hop")
    end
  })

  -- smooth scrolling
  use({ 'psliwka/vim-smoothie' })

  -- autosave
  use({ "Pocco81/AutoSave.nvim",
    config = function()
      require("settings/plugins/autosave")
    end
  })

  -- terminal
  use({ 'akinsho/toggleterm.nvim',
    config = function()
      require("settings/plugins/toggleterm").setup()
    end
  })

  -- git signs
  use({ 'lewis6991/gitsigns.nvim',
    config = function()
      require('settings/plugins/gitsigns').setup()
    end
  })


  use({ 'lukas-reineke/indent-blankline.nvim' })

  -- Highlighting syntax 
  use({ "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = function()
      require("settings/plugins/nvim-treesitter").setup()
    end
  })

  -- copy-paster history
  use({ "AckslD/nvim-neoclip.lua",
    config = function()
      require("settings/plugins/nvim-neoclip").setup()
    end
  })

  -- Coc - LSP and Extensions
  use({ 'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      require('settings/plugins/coc').setup()
    end
  })

  -- LSP and OTHER things
  -- use({ "neovim/nvim-lspconfig",
  --   config = function()
  --     require("settings/plugins/lspconfig").setup()
  --   end
  -- })

  -- use({ 'glepnir/lspsaga.nvim',
  --   config = function()
  --     require('lspsaga').init_lsp_saga()
  --   end
  -- })

  -- use({ "onsails/lspkind-nvim" })

  -- use({ "mfussenegger/nvim-dap",
  --   config = function()
  --     require("settings/plugins/nvim-dap")
  --   end
  -- })

  -- use({ "scalameta/nvim-metals",
  --   config = function()
  --     require("settings/plugins/nvim-metals").setup()
  --   end
  -- })

  -- -- completion engine
  -- use({ 'hrsh7th/nvim-cmp',
  --   config = function()
  --     require("settings/plugins/nvim-cmp").setup()
  --   end,
  --   requires = {
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-buffer',
  --     'hrsh7th/cmp-path',
  --     'hrsh7th/cmp-cmdline',
  --     'hrsh7th/cmp-vsnip',
  --     'hrsh7th/vim-vsnip',
  --   },
  -- })

  -- For a future
  -- https://github.com/rcarriga/nvim-dap-ui

  ---------------------------------------
  --          USER INTERFACE  
  ---------------------------------------
  -- Themes
  use({ 'folke/tokyonight.nvim',
    config = function()
      require("settings/plugins/themes/tokyonight").setup()
    end
  })

  --use({ 'projekt0n/github-nvim-theme',
  --  config = function()
  --    require("settings/plugins/themes/github-nvim-theme")
  --  end
  --})

  use({ "kyazdani42/nvim-web-devicons" })

  -- Status Bar
  use({ "nvim-lualine/lualine.nvim",
    config = function()
      require("settings/plugins/lualine")
    end
  })

  -- Startup view
  use({ 'glepnir/dashboard-nvim',
    config = function()
      require("settings/plugins/dashboard-nvim").setup()
    end 
  })

  ---------------------------------------
  --          LUA UTILS 
  ---------------------------------------
  use({ "nvim-lua/plenary.nvim" })

end)
