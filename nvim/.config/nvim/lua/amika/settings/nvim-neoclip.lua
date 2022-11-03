local utils = require('amika.utils')
local neoclip = utils.load('neoclip')

neoclip.setup({
  keys = {
    telescope = {
      i = {
        select = '<CR>',
        paste = '<C-p>',
        paste_behind = '<C-k>',
        replay = '<C-q>',  -- replay a macro
        delete = '<C-d>',  -- delete an entry
        custom = {},
      },
      n = {
        select = '<CR>',
        paste = 'p',
        paste_behind = 'P',
        replay = 'q',
        delete = 'd',
        custom = {},
      },
    },
  },
})
