-- Files
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fc', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true })

-- LSP
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope lsp_references<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fi', ':Telescope lsp_implementations<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fd', ':Telescope lsp_definitions<CR>', { noremap = true })

-- Docs
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fm', ':Telescope man_pages<CR>', { noremap = true })

-- Git
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Telescope git_branches<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Telescope git_commits<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gh', ':Telescope git_bcommits<CR>', { noremap = true })
