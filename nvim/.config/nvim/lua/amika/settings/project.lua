local utils = require('amika.utils')
local project = utils.load('project_nvim')
local telescope = utils.load('telescope')

project.setup({
	active = true,
	on_config_done = nil,
	manual_mode = false,
	detection_methods = { "pattern" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
	show_hidden = false,
	silent_chdir = true,
	ignore_lsp = {},
  datapath = vim.fn.stdpath("data"),
})


telescope.load_extension('projects')
