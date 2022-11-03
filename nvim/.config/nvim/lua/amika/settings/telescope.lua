local utils = require('amika.utils')
local telescope = utils.load('telescope')
local actions = utils.load('telescope.actions')

-- Extensions
telescope.load_extension('project')
telescope.load_extension('neoclip')
telescope.load_extension('notify')

local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

local main_layout_config = {
  mirror = true,
  prompt_position = 'top',
  width = 0.5,
  height = 0.5,
  preview_height = 0.4
}

telescope.setup {
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    path_display = { "smart" },
    mappings = {
      i = {
        ["<Esc>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,

        ["<C-o>"] = actions.preview_scrolling_up,
        ["<C-i>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      },

      n = {
        ["<Esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["l"] = actions.move_selection_previous,
        ["k"] = actions.move_selection_next,

        ["<Up>"] = actions.move_selection_previous,
        ["<Down>"] = actions.move_selection_next,

        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-o>"] = actions.preview_scrolling_up,
        ["<C-i>"] = actions.preview_scrolling_down,

        ["<PageDown>"] = actions.results_scrolling_down,
        ["<PageUp>"] = actions.results_scrolling_up,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = {"fd", "--type", "f", "--strip-cwd-prefix"},
      theme = "dropdown",
      layout_strategy = 'vertical',
      layout_config = main_layout_config
    },
    buffers = {
      theme = "dropdown",
      layout_strategy = 'vertical',
      layout_config = {
        mirror = true,
        prompt_position = 'top',
        width = 76,
        height = 20,
        preview_cutoff = 1,
        preview_height = 0
      },
    },
    oldfiles = {
      theme = "dropdown",
      layout_strategy = 'vertical',
      layout_config = main_layout_config
    },
    git_files = {
      theme = "dropdown",
      layout_strategy = 'vertical',
      layout_config = main_layout_config
    },
    live_grep = {
      theme = "dropdown",
      layout_strategy = 'vertical',
      layout_config = main_layout_config
    },
    neoclip = {
      theme = "dropdown",
      layout_strategy = 'vertical',
      layout_config = main_layout_config
    },
    project = {
      theme = "dropdown",
      layout_strategy = 'vertical',
      layout_config = {
        mirror = true,
        prompt_position = 'top',
      },
    }
  },
  extensions = {
    project = {
      base_dirs = { '~/Sources' },
      hidden_files = false,
      display_type = 'full'
    }
  },
}


return M
