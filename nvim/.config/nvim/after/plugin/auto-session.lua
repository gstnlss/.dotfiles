local function close_nvim_tree()
  vim.cmd [[NvimTreeClose]]
end

local function close_all_floating_wins()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
end

require('auto-session').setup {
  auto_restore = true,
  bypass_save_file_types = { 'NvimTree', 'alpha' },
  log_level = 'error',
  pre_save_cmds = { close_all_floating_wins, close_nvim_tree },
  suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' }
}

vim.keymap.set(
  'n', '<leader>se', require('auto-session.session-lens').search_session
)
