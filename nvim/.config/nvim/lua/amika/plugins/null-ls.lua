local utils = require 'amika.utils'

local null_ls = utils.load('null-ls')

null_ls.setup({
    sources = {
      -- Anything not supported by mason
    },
})
