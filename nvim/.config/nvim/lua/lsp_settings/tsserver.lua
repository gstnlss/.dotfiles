local lspconfig = require('lspconfig')
local on_attach = require('lsp_settings.utils').on_attach
local capabilities = require('lsp_settings.utils').capabilities

local function tsserver_on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
end

lspconfig.tsserver.setup({
    on_attach = tsserver_on_attach,
    capabilities = capabilities
})
