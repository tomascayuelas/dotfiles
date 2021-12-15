-- https://github.com/nvim-telescope/telescope.nvim
local Module = {}

Module.setup = function()
  local actions = require("telescope.actions")

  require("telescope").setup({
    defaults = {
      previewer = true,
      path_display = { 'smart' },
      file_ignore_patterns = { "target", "node_modules", "parser.c", "out" },
      prompt_prefix = " ",
      selection_caret = "> ",
      mappings = {
        n = {
          ["f"] = actions.send_to_qflist,
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      },
      live_grep = {
        theme = "dropdown"
      },
      buffers = {
        theme = "dropdown",
      },
      neoclip = {
        previewer = false,
        theme = 'dropdown'
      }
    }
  })

  require("telescope").load_extension("neoclip")
  require("telescope").load_extension("coc")
end

return Module
