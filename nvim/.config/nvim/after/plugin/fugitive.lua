vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set(
  'n', '<leader>gd', function()
    vim.cmd [[Git diff]]
  end
)
vim.keymap.set(
  'n', '<leader>gp', function()
    vim.cmd [[Git pull]]
  end
)

