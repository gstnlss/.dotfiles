local lspconfig = require('lspconfig')
local capabilities = require('lsp_settings.utils').capabilities

lspconfig.tailwindcss.setup({ capabilities = capabilities })
