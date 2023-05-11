local utils = require 'amika.utils'

local indentBlankLine = utils.load('indent_blankline')

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"

indentBlankLine.setup({
  show_current_context = true,
  show_current_context_start = true,
})
