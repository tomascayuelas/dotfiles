local utils = require 'amika.utils'

local masonLspConfig = utils.load('mason-lspconfig')

masonLspConfig.setup({
  ensure_installed = {
    'bashls',
    'clangd',
    'cssls',
    'dockerls',
    'docker_compose_language_service',
    'eslint',
    'elmls',
    'gradle_ls',
    'graphql',
    'gopls',
    'html',
    'haskell',
    'helm_ls',
    'jsonls',
    'jdtls',
    'lua_ls',
    'marksman',
    'intelephense',
    'pyright',
    'sqls',
    'terraformls',
    'tsserver',
    'vuels',
    'lemminx',
    'yamlls'
  },
})
