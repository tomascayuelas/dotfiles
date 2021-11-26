local Module = {}

Module.setup = function()
  Variable.g({
    coc_global_extensions = {
      'coc-css',
      'coc-go',
      'coc-html',
      'coc-json',
      'coc-markdownlint',
      'coc-metals',
      'coc-pyright',
      'coc-python',
      'coc-rust-analyzer',
      'coc-sh',
      'coc-tsserver',
      'coc-vetur',
      'coc-yaml'
    }
  })
end

return Module
