Option:global({
   ------------------------------------------
   -- EDITOR
   ------------------------------------------

  -- replace tab with spaces
  expandtab = true,

  -- tabstop
  tabstop = 4,

  -- acts editing spaces like tabs
  softtabstop = 2,

  -- number of spaces to use  for indentation
  shiftwidth = 2,

  -- remove highlighting after search is done
  hlsearch = false,

  -- auto code folding when openeing new file at level 1
  foldlevelstart = 4,

  -- don't wrap the text when lines can't fit the window
  wrap = false,

  -- auto wrap after 80 characters in the line
  textwidth = 120,

  -- enable mouse in vim. 'a' for all modes (normal, visual, insert & command)
  mouse = 'a',

  -- 'backup' 'writebackup'	action	~
  -- off	     off	no backup made
  -- off	     on		backup current file, deleted afterwards (default)
  -- on	     off	delete old backup, backup current file
  -- on	     on		delete old backup, backup current file
  backup = false,
  writebackup = true,
  swapfile = false,

  -- write changes to swap file after "n" ms
  -- for some reason when the updatetime is high, autocompletion in coc nvim
  -- takes a long time
  updatetime = 300,

  -- controls how short messages are displayed in status bar section
  shortmess = vim.o.shortmess .. 'c',

  -- open completion menu even for single item
  -- do not auto insert items from completion menu
  -- @warning - preview is removed. when it's on, default lsp opens a vertical tab
  completeopt = 'menu,menuone,noselect',

  -- stop showing the current mode
  showmode = false,

  -- stop showing the status in status bar
  laststatus = 2,

  showcmd = false,

  -- stop showing the current line and cursor position in the status bar
  ruler = true,

  -- set the font for GUI clients like neovide
  guifont = 'Cascadia Code, FiraCode, Nerd Font',

  -- highlight the current cursor line.
  cursorline = false,

  -- operator pending timeout
  timeoutlen = 500,

  ----------------------------------------------------------------------
  --                             EDITING                              --
  ----------------------------------------------------------------------
  smartcase = true,
  ignorecase = true,

  -- shows the effects of a command incrementally
  inccommand = 'nosplit',

  -- where to place the new split windows
  splitright = true,
  splitbelow = true,

  -- hide unsaved file when closing the buffer
  -- usually vim doesn't allow closing unsaved buffer unless you force it
  -- but with hidden option, buffer will be hidden when you close it
  -- vim will prompt you to save when closing vim editor
  hidden = true,

  ----------------------------------------------------------------------
  --                                UI                                --
  ----------------------------------------------------------------------
  termguicolors = true,
    
  clipboard = 'unnamedplus',
})

Option:window({
  ----------------------------------------------------------------------
  --                              EDITOR                              --
  ----------------------------------------------------------------------
  number = true,
  relativenumber = false,
  -- foldmethod = 'syntax',
  signcolumn = 'auto',
  scrolloff = 15,
})

Option:buffer({
  -- set the tab size to length of 4 spaces
  -- shiftwidth set the indentation length
  shiftwidth = 2,
})
