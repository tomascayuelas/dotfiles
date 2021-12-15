local Module = {}

Module.setup = function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    highlight = {
      enable = true,
      --disable = { "scala" },
    }
  })
end

return Module
