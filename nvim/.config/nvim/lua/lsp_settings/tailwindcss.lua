local lspconfig = require('lspconfig')
local on_attach = require('lsp_settings.utils').on_attach
local capabilities = require('lsp_settings.utils').capabilities

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities
})
