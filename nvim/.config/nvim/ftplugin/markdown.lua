if require('zk.util').notebook_root(vim.fn.expand('%:p')) ~= nil then
  local function map(...)
    vim.api.nvim_buf_set_keymap(0, ...)
  end
  local opts = { noremap = true, silent = false }

  map('n', '<leader>zb', '<Cmd>ZkBacklinks<CR>', opts)
  map('n', '<leader>zl', '<Cmd>ZkLinks<CR>', opts)
  map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('v', '<leader>ca', ':\'<,\'>lua vim.lsp.buf.range_code_action()<CR>', opts)
  map('n', '<leader>zi', '<Cmd>ZkIndex<CR>', opts)
end
