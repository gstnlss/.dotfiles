-- Files
vim.api.nvim_set_keymap('n', '<Leader>p', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>bf', ':Telescope buffers<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>fc', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true })

-- LSP
vim.api.nvim_set_keymap('n', 'gr', ':Telescope lsp_references<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gi', ':Telescope lsp_implementations<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gd', ':Telescope lsp_definitions<CR>', { noremap = true })

-- Docs
-- vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>fm', ':Telescope man_pages<CR>', { noremap = true })

-- Git
-- vim.api.nvim_set_keymap('n', '<Leader>gb', ':Telescope git_branches<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>gc', ':Telescope git_commits<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>gh', ':Telescope git_bcommits<CR>', { noremap = true })
