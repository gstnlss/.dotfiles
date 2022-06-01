local lspconfig = require('lspconfig')
local on_attach = require('lsp_settings.utils').on_attach
local capabilities = require('lsp_settings.utils').capabilities
local pid = vim.fn.getpid()

local omnisharp_bin = '/usr/bin/omnisharp'

lspconfig.omnisharp.setup {
  cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
  on_attach = on_attach,
  capabilities = capabilities,
}
