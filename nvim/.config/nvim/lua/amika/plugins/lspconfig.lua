local utils = require 'amika.utils'

local lspconfig = utils.load('lspconfig')
local cmp_capabilities = require 'cmp_nvim_lsp'.default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = cmp_capabilities,
  }
end

lspconfig.lua_ls.setup({
  single_file_support = true
})
