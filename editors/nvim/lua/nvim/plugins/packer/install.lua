require 'packer'.init({ max_jobs = 2 })

return require 'packer'.startup(
function()
  ---@diagnostic disable-next-line: undefined-global
  local use = use


  -------------------------------------
  --          FILE MANAGERS
  -------------------------------------
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'nvim.plugins.nvim-tree'
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require 'nvim.plugins.telescope'
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
  }

  ---------------------------------------
  --            EDITING
  ---------------------------------------
  -- auto pair brackets
  use { 'jiangmiao/auto-pairs' }

  -- handle pairs of text objects
  use { 'tpope/vim-surround' }


  ---------------------------------------
  --            EDITOR 
  ---------------------------------------
  -- inline serch guide
  use { 'unblevable/quick-scope' }

  -- smooth scrolling
  use { 'psliwka/vim-smoothie' }
  

  ---------------------------------------
  --          USER INTERFACE  
  ---------------------------------------
  use {
    'marko-cerovac/material.nvim',
    config = function()
      Variable.g({ material_style = 'palenight' })
      CMD('colorscheme material')
    end,
  }
        
end)
