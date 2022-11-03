local utils = require('amika.utils')
local lspconfig = utils.load('lspconfig')
-- local cmp_nvim_lsp = utils.load('cmp_nvim_lsp')
local keymap = vim.keymap

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- Add additioncal capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
-- 
-- capabilities.textDocuemnt.completion.completionItem = {
--   documentationFormat = { "markdown", "plaintext" },
--   snippetSupport = true,
--   preselectSupport = true,
--   insertReplaceSupport = true,
--   labelDetailsSupport = true,
--   deprecatedSupport = true,
--   commitCharactersSupport = true,
--   tagSupport = { valueSet = { 1 } },
--   resolveSupport = {
--     properties = {
--       "documentation",
--       "detail",
--       "additionalTextEdits",
--     },
--   },
-- }

lspconfig['sumneko_lua'].setup({
  on_attach = on_attach,
  -- capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

lspconfig['pyright'].setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig['jdtls'].setup({
  on_attach = on_attach,
  capabilities = capabilities
})
