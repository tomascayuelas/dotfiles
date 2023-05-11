local utils = require 'amika.utils'

local project = utils.load('project_nvim')

project.setup({
  patterns = { ".git", "_darcs", ".svn", "Makefile", "package.json" },
  detection_methods = { 'lsp', 'pattern'},
})
