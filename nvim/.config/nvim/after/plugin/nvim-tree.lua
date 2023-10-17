require('nvim-tree').setup(
  {
    diagnostics = { enable = true, show_on_dirs = true },
    disable_netrw = true,
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
      open_file = { quit_on_open = true, window_picker = { enable = true } },
      change_dir = { global = true }
    },
    live_filter = { prefix = 'Filter: ', always_show_folders = false },
    filesystem_watchers = { enable = true },
    sync_root_with_cwd = true
  }
)

vim.keymap.set(
  'n', '<leader>e', vim.cmd.NvimTreeFindFileToggle, { noremap = true }
)
