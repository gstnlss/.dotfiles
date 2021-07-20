local lspconfig = require('lspconfig')
local on_attach = require('lsp_settings.utils').on_attach
local capabilities = require('lsp_settings.utils').capabilities

local servers = { 'tsserver' }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end

require('lsp_settings.sumneko_lua')
