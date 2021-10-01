-- following options are the default
Variable.g(
    {
        nvim_tree_ignore = { '.git', 'node_modules', '.cache' },
        nvim_tree_gitignore = 1,
        nvim_tree_quit_on_open = 0,
        nvim_tree_indent_markers = 1,
        nvim_tree_hide_dotfiles = 1,
        nvim_tree_git_hl = 1,
        nvim_tree_highlight_opened_files = 1,
        nvim_tree_root_folder_modifier = ':~',
        nvim_tree_add_trailing = 1,
        nvim_tree_group_empty = 1,
        nvim_tree_disable_window_picker = 0,
        nvim_tree_icon_padding = ' ',
        nvim_tree_symlink_arrow = ' >> ',
        nvim_tree_respect_buf_cwd = 1,
        nvim_tree_create_in_closed_folder = 0,
        nvim_tree_refresh_wait = 500,
        nvim_tree_window_picker_exclude = {
            filetype = { 'notify', 'packer', 'qf' },
            buftype = { 'terminal' },
        },
        nvim_tree_show_icons = {
            git = 1,
            folders = 1,
            files = 1,
            folder_arrows = 1,
        },
        nvim_tree_icons = {
            default = '',
            symlink = '',
            git = {
                unstaged = '✗',
                staged = '✓',
                unmerged = '',
                renamed = '➜',
                untracked = '★',
                deleted = '',
                ignored = '◌',
            },
            folder = {
                arrow_open = '',
                arrow_closed = '',
                default = '',
                open = '',
                empty = '',
                empty_open = '',
                symlink = '',
                symlink_open = '',
            },
            lsp = {
                hint = ' ',
                info = ' ',
                warning = ' ',
                error = ' ﱥ',
            },
        },
    })

local opt = { noremap = true, silent = true }

Keybind.g({
    { 'n', ',n', ':NvimTreeToggle<cr>', opt },
    { 'n', ',,', ':NvimTreeFindFile<cr>', opt },
})

require 'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually) 
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  lsp_diagnostics     = false,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 50,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}