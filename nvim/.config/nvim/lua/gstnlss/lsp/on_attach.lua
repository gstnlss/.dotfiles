local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set(
    'n', 'gd', function()
      vim.lsp.buf.definition()
    end, opts
  )
  vim.keymap.set(
    'n', '<leader>d', function()
      vim.diagnostic.open_float()
    end, opts
  )
  vim.keymap.set(
    'n', '[d', function()
      vim.diagnostic.goto_next()
    end, opts
  )
  vim.keymap.set(
    'n', ']d', function()
      vim.diagnostic.goto_prev()
    end, opts
  )
  vim.keymap.set(
    { 'n', 'v', 'x' }, '<leader>ca', function()
      vim.lsp.buf.code_action()
    end, opts
  )
  vim.keymap.set(
    'n', '<leader>rn', function()
      vim.lsp.buf.rename()
    end, opts
  )
  vim.keymap.set(
    'i', '<C-h>', function()
      vim.lsp.buf.signature_help()
    end, opts
  )

  vim.keymap.set(
    'n', '<leader>lr', function()
      vim.cmd('LspRestart')
    end
  )
end

return on_attach
