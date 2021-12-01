-- Remap space as leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, expr = true, silent = true })
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-p>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>x', ':bdelete<CR>', { noremap = true })

require('keymaps.compe')
require('keymaps.nerdtree')
require('keymaps.telescope')
require('keymaps.vim_fugitive')

