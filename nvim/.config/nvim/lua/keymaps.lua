local keymaps = {}

-- Remap space as leader
vim.api.nvim_set_keymap(
  '', '<Space>', '<Nop>', { noremap = true, expr = true, silent = true }
)
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- Split navigation
vim.api.nvim_set_keymap(
  'n', '<C-h>', '<C-w>h', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<C-j>', '<C-w>j', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<C-k>', '<C-w>k', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<C-l>', '<C-w>l', { noremap = true, silent = true }
)

-- Buffer navigation
vim.api.nvim_set_keymap(
  'n', '<C-p>', ':bprevious<CR>', { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n', '<C-n>', ':bnext<CR>', { noremap = true, silent = true }
)

keymaps.BClose = function()
  vim.cmd('bprevious');
  vim.cmd('bd#');
end
vim.api.nvim_set_keymap(
  'n', '<Leader>x', ':lua require("keymaps").BClose()<CR>',
    { noremap = true, silent = true }
)

-- Files
vim.api.nvim_set_keymap(
  'n', '<Leader>p', ':Telescope find_files<CR>', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<Leader>f', ':Telescope live_grep<CR>', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<Leader><tab>', ':Telescope buffers<CR>', { noremap = true }
)

-- Vim integration
vim.api.nvim_set_keymap('n', '<Leader>gs', ':G<CR>', { noremap = true })

vim.api.nvim_set_keymap(
  'n', '<Leader>m', ':DogeGenerate<CR>', { noremap = true }
)

-- Reload vimrc
vim.api.nvim_set_keymap(
  'n', '<Leader><Leader>', ':source $MYVIMRC<CR>',
    { noremap = true, silent = true }
)

return keymaps
