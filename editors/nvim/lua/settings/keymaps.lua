local l = Keybind.luaCmd
local c = Keybind.cmd
local n = Keybind.normalCmd
local refresh_plugins = require("utils").refresh_plugins

vim.g.mapleader = ','

Keybind.g({
  -- Refresh plugins
  { 'n', '<leader><leader>c', l'refresh_plugins()' },
})

-- map("n", "<leader>nhs", ":nohlsearch<cr>")
-- map("n", "<leader>xml", ":%!xmllint --format -<cr>")
-- map("n", "<leader>fo", ":copen<cr>")
-- map("n", "<leader>fc", ":cclose<cr>")
-- map("n", "<leader>fn", ":cnext<cr>")
-- map("n", "<leader>fp", ":cprevious<cr>")
-- map("n", "<leader>tv", ":vnew | :te<cr>")
-- 
-- map("n", "<leader>st", l'require("metals").toggle_setting("showImplicitArguments")'
-- 
-- -- nvim-dap
-- map("n", "<leader>dc", l'require"dap".continue()'
-- map("n", "<leader>dr", l'require"dap".repl.toggle()'
-- map("n", "<leader>ds", l'require"dap.ui.variables".scopes()'
-- map("n", "<leader>dK", l'require"dap.ui.widgets".hover()'
-- map("n", "<leader>dt", l'require"dap".toggle_breakpoint()'
-- map("n", "<leader>dso", l'require"dap".step_over()'
-- map("n", "<leader>dsi", l'require"dap".step_into()'
-- map("n", "<leader>dl", l'require"dap".run_last()'
-- 
-- 
-- -- scala-utils
-- map("n", "<leader>slc", l'RELOAD("scala-utils.coursier").complete_from_line()'
-- map("n", "<leader>sc", l'RELOAD("scala-utils.coursier").complete_from_input()'
-- 

---------------------------------------
--            CURSOR MODE
---------------------------------------
Shortcut:mode(''):options():noremap():next():keymaps({
  { 'j', 'h' },
  { 'k', 'j' },
  { 'l', 'k' },
  { ';', 'l' },
})

--------------------------------------
--            NORMAL MODE
--------------------------------------
Shortcut:mode('n'):options():noremap():next():keymaps({
  -- reload nvim configuration file
  { ',r', l'require("nvim.utils.common.module").reload_package("nvim")' },

    -- move cursor to left/down/up/right window
  { '<c-w>j', '<c-w>h' },
  { '<c-w>k', '<c-w>j' },
  { '<c-w>l', '<c-w>k' },
  { '<c-w>;', '<c-w>l' },

  -- move to last cursor position in the jump list
  { [['']], '``' },

  -- to go to the start of the line
  { '0', '^' },

  -- centering the cursor after action
  { '{', '{zz' },
  { '}', '}zz' },

  -- jump to next matching char in the same line
  { '<leader>;', ';' },

  -- save the current buffer
  { '<leader>l', c'w' },

  -- close the window
  { '<leader>q', c'q' },

  -- open the file under the cursor in a split or selected window
  {
      'gf',
      function()
          require("nvim.utils.nvim.file").open_file_under_cursor()
      end,
  },

  -- open the file under the cursor in the same window
  { 'gF', 'gf' },

  -- copy until the end of the line
  { 'Y', 'y$' },

  -- copy current line and paste next line
  { '<leader>y', 'yyp' },

  -- indent left
  { '<', '<<' },

  -- indent right
  { '>', '>>' },

  -- to go enable spell checker
  { '<F6>', c 'setlocal spell! spelllang=en_us' },


  -- Nvim-Tree
  { '<leader>1', c'NvimTreeToggle<cr>' },

  -- Telescope
  { '<leader>cc', c'Telescope commands' },
  { '<leader>ff', c'Telescope find_files' },
  { '<leader>lg', c'Telescope live_grep' },
  { '<leader>ee', c'Telescope buffers' },
  { '<leader>vv', c'Telescope neoclip' },

  -- Hop (EasyMotion)
  { '$', c'HopWord' },

  -- Terminal
  { '<leader>0', c'ToggleTerm' },

  -- LazyGit
  { '<leader>9', c'TermExec cmd="lazygit" close_on_exit=True' },

  -- LSP
  { 'gD', l'vim.lsp.buf.definition()' },
  { 'K', l'vim.lsp.buf.hover()' },
  { 'gi', l'vim.lsp.buf.implementation()' },
  { 'gr', l'vim.lsp.buf.references()' },
  { 'gds', l'require"telescope.builtin".lsp_document_symbols()' },
  { 'gws', l'require"settings.plugins.telescope".lsp_workspace_symbols()' },
  { '<leader>sh', l'vim.lsp.buf.signature_help()' },
  { '<leader>rn', l'vim.lsp.buf.rename()' },
  { '<leader>ca', l'vim.lsp.buf.code_action()' },
  { '<leader>ws', l'require("metals").hover_worksheet()' },
  { '<leader>a',  l'require("metals").open_all_diagnostics()' },
  { '<leader>tt', l'require("metals.tvp").toggle_tree_view()' },
  { '<leader>tr', l'require("metals.tvp").reveal_in_tree()' },
  { '<leader>cl', l'vim.lsp.codelens.run()' },
})


---------------------------------------
--            INSERT MODE
---------------------------------------
Shortcut:mode('i'):options():noremap():next():keymaps({
    { 'jj', n'<ESC>' },
    -- put a semicolon EOL and go to next line
    { '<c-;>', n'A;' },

    -- add new line in insert mode
    { '<c-o>', n'o' },

    -- go to end of the line
    { '<c-e>', n'A' },

    -- go to beginning of the line
    { '<c-a>', n'I' },

    -- copy current line and paste next line
    { '<c-y>', n'yyp' },
})

---------------------------------------
--            VISUAL MODE
---------------------------------------
Shortcut:mode('x'):options():noremap():next():keymaps({
    { 'j', 'h' },
    { 'k', 'j' },
    { 'l', 'k' },
    { ';', 'l' },

    -- LSP - Metals
    { "<leader>gt", l'require("metals").type_of_range()' },
})
