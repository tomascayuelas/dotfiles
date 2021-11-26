vim.cmd([[autocmd FileType markdown setlocal textwidth=80]])
vim.cmd(
  [[autocmd BufReadPost,BufNewFile *.md,*.txt,COMMIT_EDITMSG set wrap linebreak nolist spell spelllang=en_us complete+=kspell]]
)
vim.cmd([[autocmd BufReadPost,BufNewFile .html,*.txt,*.md,*.adoc set spell spelllang=en_us]])
vim.cmd([[autocmd TermOpen * startinsert]])

vim.cmd([[augroup colorset]])
vim.cmd([[autocmd!]])

-- LSP
vim.cmd([[augroup lsp]])
vim.cmd([[autocmd!]])

-- used in textDocument/hightlight
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

-- Diagnostic specific colors
vim.cmd([[hi! DiagnosticError guifg=#e06c75]]) -- light red
vim.cmd([[hi! DiagnosticWarn guifg=#e5c07b]]) -- light yellow
vim.cmd([[hi! DiagnosticInfo guifg=#56b6c2]]) -- cyan
vim.cmd([[hi! link DiagnosticHint DiagnosticInfo]])

-- _Maybe_ try underline for a bit
vim.cmd([[hi! DiagnosticUnderlineError cterm=NONE gui=underline guifg=NONE]])
vim.cmd([[hi! DiagnosticUnderlineWarn cterm=NONE gui=underline guifg=NONE]])
vim.cmd([[hi! DiagnosticUnderlineInfo cterm=NONE gui=underline guifg=NONE]])
vim.cmd([[hi! DiagnosticUnderlineHint cterm=NONE gui=underline guifg=NONE]])

vim.cmd([[augroup END]])

vim.cmd([[command! Format lua vim.lsp.buf.formatting()]])
