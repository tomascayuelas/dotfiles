-- following options are the default
Variable.g({
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

require('nvim-tree').setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },

  view = {
    width = 40,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

