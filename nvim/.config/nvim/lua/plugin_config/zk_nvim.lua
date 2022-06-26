require('zk').setup({ picker = 'telescope' })

-- Keymaps
local opts = { noremap = true, silent = false }
vim.api.nvim_set_keymap(
  'n', '<leader>zn', '<cmd>ZkNew { title = vim.fn.input("Title:") }<CR>', opts
)
vim.api.nvim_set_keymap(
  'n', '<leader>zo', '<Cmd>ZkNotes { sort = { \'modified\' } }<CR>', opts
)
vim.api.nvim_set_keymap('n', '<leader>zt', '<Cmd>ZkTags<CR>', opts)
vim.api.nvim_set_keymap(
  'n', '<leader>zf',
    '<Cmd>ZkNotes { sort = { \'modified\' }, match = vim.fn.input(\'Search: \') }<CR>',
    opts
)
vim.api.nvim_set_keymap('v', '<leader>zf', ':\'<,\'>ZkMatch<CR>', opts)
