local Module = {}


Module.setup = function()
  local lsp_config = require("lspconfig")
  -- sumneko lua
  -- local sumneko_root_path = "/home/tomascayuelas/.config/nvim/lua/nvim/plugins/lua-language-server"
  --local sumneko_binary = "/home/tomascayuelas/.config/nvim/lua/nvim/plugins/lua-language-server/bin/Linux/lua-language-server"

  --lsp_config.sumneko_lua.setup({
  --  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  --  commands = {
  --    Format = {
  --      function()
  --        require("stylua-nvim").format_file()
  --      end,
  --    },
  --  },
  --  settings = {
  --    Lua = {
  --      runtime = {
  --        version = "LuaJIT", -- since using mainly for neovim
  --        path = vim.split(package.path, ";"),
  --      },
  --      diagnostics = { globals = { "vim", "it", "describe", "before_each"} },
  --      workspace = {
  --        -- Make the server aware of Neovim runtime files
  --        library = {
  --          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
  --          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
  --        },
  --      },
  --      telemetry = { enable = false },
  --    },
  --  },
  -- )

  lsp_config.dockerls.setup({})
  lsp_config.html.setup({})
  lsp_config.jsonls.setup({
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
        end,
      },
    },
  })
  lsp_config.tsserver.setup({})
  lsp_config.yamlls.setup({})
  lsp_config.racket_langserver.setup({})
  lsp_config.pyright.setup({})
  lsp_config.elmls.setup({})

  -- Uncomment for trace logs from neovim
  --vim.lsp.set_log_level('trace')
end

return Module
