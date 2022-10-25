local lspconfig = require('lspconfig')
local lsp_settings_utils = require('lsp_settings.utils')
local on_attach = lsp_settings_utils.on_attach
local capabilities = lsp_settings_utils.capabilities

local pid = vim.fn.getpid()

lspconfig.omnisharp.setup {
  cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(pid) },
  on_attach = function(client, bufnr)
    on_attach.lsp_keymaps(client, bufnr)
    on_attach.autoformatter(client, bufnr)
    on_attach.highlight(client, bufnr)
  end,
  capabilities = capabilities
}
