local Module = {}

Module.setup = function()
  local cmd = vim.cmd
  local g = vim.g

  local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end

  ----------------------------------
  -- COMMANDS ----------------------
  ----------------------------------
  -- LSP
  cmd([[augroup lsp]])
  cmd([[autocmd!]])
  cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
  cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
  cmd([[augroup end]])

  -- Need for symbol highlights to work correctly
  vim.cmd([[hi! link LspReferenceText CursorColumn]])
  vim.cmd([[hi! link LspReferenceRead CursorColumn]])
  vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

  ----------------------------------
  -- LSP Setup ---------------------
  ----------------------------------
  metals_config = require("metals").bare_config()

  metals_config.settings = {
    showImplicitArguments = true,
    showInferredType = true,
    excludedPackages = {
      "akka.actor.typed.javadsl",
      "com.github.swagger.akka.javadsl",
      "akka.stream.javadsl",
    },
    fallbackScalaVersion = "2.13.6",
    --serverProperties = {
    --  "-Dmetals.scala-cli.launcher=/usr/local/bin/scala-cli",
    --},
  }

  -- Example if you are including snippets
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  metals_config.capabilities = capabilities
  metals_config.init_options.statusBarProvider = "on"

  metals_config.on_attach = function(client, bufnr)
    require("metals").setup_dap()
  end

  -- Should link to something to see your code lenses
  cmd([[hi! link LspCodeLens CursorColumn]])
  -- Should link to something so workspace/symbols are highlighted
  cmd([[hi! link LspReferenceText CursorColumn]])
  cmd([[hi! link LspReferenceRead CursorColumn]])
  cmd([[hi! link LspReferenceWrite CursorColumn]])

  -- If you want a :Format command this is useful
  cmd([[command! Format lua vim.lsp.buf.formatting()]])
end

return Module
