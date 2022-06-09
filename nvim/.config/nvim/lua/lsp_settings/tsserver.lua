local lspconfig = require('lspconfig')
local lsp_settings_utils = require('lsp_settings.utils')
local on_attach = lsp_settings_utils.on_attach
local capabilities = lsp_settings_utils.capabilities

lspconfig.tsserver.setup(
  {
    on_attach = function(client, bufnr)
      on_attach.lsp_keymaps(client, bufnr)
      on_attach.highlight(client, bufnr)
      on_attach.disable_formatting(client)
    end,
    capabilities = capabilities,
    init_options = { preferences = { disableSuggestions = true } }
  }
)
