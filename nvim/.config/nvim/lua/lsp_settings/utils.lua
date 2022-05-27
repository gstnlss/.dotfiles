local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    if (bufnr) then
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
  end

  -- Sets buffer option
  local function buf_set_option(...)
    if (bufnr) then
      vim.api.nvim_buf_set_option(bufnr, ...)
    end
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local options = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
  buf_set_keymap(
    'n', '<Leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options
  )
  -- buf_set_keymap(
  --   'n', '<Leader>wa', 'cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
  --     options
  -- )
  -- buf_set_keymap(
  --   'n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
  --     options
  -- )
  -- buf_set_keymap(
  --   'n', '<Leader>wl',
  --     '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
  --     options
  -- )
  -- buf_set_keymap(
  --   'n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options
  -- )
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
  buf_set_keymap(
    'n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', options
  )
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', options)
  buf_set_keymap(
    'n', '<Leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    options
  )
  buf_set_keymap(
    'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', options
  )
  buf_set_keymap(
    'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', options
  )
  buf_set_keymap(
    'n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', options
  )
  -- buf_set_keymap(
  --   'n', '<Leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>', options
  -- )
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return { on_attach = on_attach, capabilities = capabilities }
