local utils = require('amika.utils')
local mason_lspconfig = utils.load('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = {
    -- LSP
    'bashls',
    'sumneko_lua',
    'jdtls',
    'kotlin_language_server',
    'pyright',

    -- Formatter
    'stylua',

    -- Linters
  },

  automatic_installation = true
})
