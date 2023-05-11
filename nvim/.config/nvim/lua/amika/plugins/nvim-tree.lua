local utils = require 'amika.utils'

local nvimTree = utils.load('nvim-tree')

nvimTree.setup({
  sort_by = 'case_sensitive',
  view = {
    width = 50,
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})
