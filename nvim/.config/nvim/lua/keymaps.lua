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

keymaps.BClose = function()
  local buffer_count = 0;

  for buffer = 1, vim.fn.bufnr('$') do
    if vim.fn.buflisted(buffer) == 1 then
      buffer_count = buffer_count + 1;
    end
  end

  if buffer_count > 1 then
    local current_buffer = vim.fn.bufnr('%')
    vim.cmd('bprevious')
    vim.cmd('bd#')
    print('[Info] Buffer ' .. current_buffer .. ' deleted.')
  else
    print('[Info] Last buffer. Delete aborted.')
  end
end
vim.api.nvim_set_keymap(
  'n', '<Leader>x', ':lua require("keymaps").BClose()<CR>',
    { noremap = true, silent = true }
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
