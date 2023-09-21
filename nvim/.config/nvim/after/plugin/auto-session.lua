require('auto-session').setup {
  log_level = 'error',
  auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  auto_restore_enabled = false,
  bypass_session_save_file_types = { 'NvimTree', 'alpha' }
}

vim.keymap.set(
  'n', '<leader>se', require('auto-session.session-lens').search_session
)
