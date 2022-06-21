require('nvim-tree').setup(
  {
    diagnostics = { enable = true, show_on_dirs = true },
    disable_netrw = true,
    open_on_setup = true,
    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor = true,
    view = {
      adaptive_size = true,
      centralize_selection = true,
      number = true,
      relativenumber = true,
      preserve_window_proportions = true
    },
    renderer = {
      add_trailing = true,
      highlight_opened_files = 'icon',
      indent_markers = { enable = true }
    },
    actions = {
      open_file = { quit_on_open = true, window_picker = { enable = false } }
    },
    live_filter = { prefix = 'Filter: ', always_show_folders = false },
    filesystem_watchers = { enable = true }
  }
)

vim.api.nvim_set_keymap(
  'n', '<Leader>e', ':NvimTreeFindFileToggle<CR>',
    { noremap = true, silent = true }
)
