local on_attach = {}

on_attach.lsp_keymaps = function(_, bufnr)
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

  -- TODO: make this simpler and easier on the eyes, (use config table and loop to use buf_set_keymap)
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
  buf_set_keymap('n', '<Leader>gf', '<cmd>lua vim.lsp.buf.format()<CR>', options)
  buf_set_keymap('n', '<Leader>t', ':TroubleToggle<CR>', options)
end

local HIGHLIGHT_AUGROUP = 'MyLspDocumentHighlight'
on_attach.highlight = function(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    local augroup_id = vim.api.nvim_create_augroup(
      HIGHLIGHT_AUGROUP, { clear = true }
    )
    vim.api.nvim_create_autocmd(
      'CursorHold', {
        callback = vim.lsp.buf.document_highlight,
        buffer = bufnr,
        group = augroup_id,
        desc = 'Document Highlight'
      }
    )
    vim.api.nvim_create_autocmd(
      'CursorMoved', {
        callback = vim.lsp.buf.clear_references,
        buffer = bufnr,
        group = augroup_id,
        desc = 'Clear All the References'
      }
    )
  end
end

local FORMATTING_AUGROUP = 'MyLspFormatting'
local augroup_id = vim.api.nvim_create_augroup(
  FORMATTING_AUGROUP, { clear = true }
)
on_attach.autoformatter = function(client, bufnr)
  if client.supports_method('textDocument/formatting') then
    -- vim.api.nvim_clear_autocmds({ group = FORMATTING_AUGROUP, buffer = bufnr })
    vim.api.nvim_create_autocmd(
      'BufWritePre', {
        group = augroup_id,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end
      }
    )
    client.server_capabilities.documentFormattingProvider = true
  end
end

on_attach.disable_formatting = function(client)
  client.server_capabilities.documentFormattingProvider = false
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
);
capabilities.textDocument.completion.completionItem.snippetSupport = true

return { on_attach = on_attach, capabilities = capabilities }
