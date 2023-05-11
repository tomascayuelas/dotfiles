local utils = require 'amika.utils'

local mason_null_ls = utils.load('mason-null-ls')

mason_null_ls.setup({
  automatic_setup = true,
  automatic_installation = false,
  ensure_installed = nil,
  handlers = {},
})

