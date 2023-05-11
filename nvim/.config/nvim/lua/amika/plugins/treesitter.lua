local utils = require 'amika.utils'

local treesitter = utils.load('nvim-treesitter.configs')

treesitter.setup {
  ensure_installed = {
    'c',
    'rust',
    'javascript',
    'typescript',
    'python',
    'kotlin',
    'java',
    'scala',
    'vim',
    'vimdoc',
    'query',
    'markdown',
    'lua',
    'json',
    'dockerfile',
    'css',
    'erlang',
    'elixir',
    'hocon',
    'html',
    'php',
    'scss',
    'sql',
    'terraform',
    'bash',
  },

  sync_installed = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  context_commentstring = {
    enable = true
  }
}
