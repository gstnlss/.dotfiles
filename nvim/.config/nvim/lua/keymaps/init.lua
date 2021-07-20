-- Remap space as leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, expr = true, silent = true })
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

require('keymaps.compe')
require('keymaps.nerdtree')
require('keymaps.telescope')
require('keymaps.vim_fugitive')

