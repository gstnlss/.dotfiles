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

  buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', options)
  buf_set_keymap('n', 'gr', ':Telescope lsp_references<CR>', options)
  buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', options)
  buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', options)
  buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', options)
  buf_set_keymap('n', 'gh', ':lua vim.lsp.buf.signature_help()<CR>', options)
  buf_set_keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', options)
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
  buf_set_keymap(
    'n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', options
  )
  buf_set_keymap(
    'n', '<Leader>d',
    ':lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>',
    options
  )
  buf_set_keymap(
    'n', '[d',
    ':lua vim.diagnostic.goto_prev({ float = { border = "single" }})<CR>',
    options
  )
  buf_set_keymap(
    'n', ']d',
    '<cmd>lua vim.diagnostic.goto_next({ float = { border = "single" }})<CR>',
    options
  )
  buf_set_keymap(
    'n', '<Leader>gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', options
  )
  buf_set_keymap('n', '<Leader>t', ':TroubleToggle<CR>', options)

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
    vim.api.nvim_clear_autocmds {
      buffer = bufnr,
      group = 'lsp_document_highlight'
    }
    vim.api.nvim_create_autocmd(
      'CursorHold', {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = 'lsp_document_highlight',
      desc = 'Document Highlight'
    }
    )
    vim.api.nvim_create_autocmd(
      'CursorMoved', {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = 'lsp_document_highlight',
      desc = 'Clear All the References'
    }
    )
  end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
);
capabilities.textDocument.completion.completionItem.snippetSupport = true

return { on_attach = on_attach, capabilities = capabilities }
