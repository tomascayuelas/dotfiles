local utils = require 'amika.utils'

local which_key = utils.load('which-key')

which_key.setup()


local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  f = {
    name = "Files",
    f = { "<cmd>Telescope find_files<cr>", "Find File"},
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File"},
    n = { "<cmd>enew<cr>", "New File" },
    e = { "Edit File"},
  }
}

which_key.register(mappings, opts)
