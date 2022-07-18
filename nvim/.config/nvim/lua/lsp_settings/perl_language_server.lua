local lspconfig = require('lspconfig')
local lsp_settings_utils = require('lsp_settings.utils')
local on_attach = lsp_settings_utils.on_attach

lspconfig.perlpls.setup(
  {
    on_attach = function(client, bufnr)
      on_attach.lsp_keymaps(client, bufnr)
      on_attach.autoformatter(client, bufnr)
      on_attach.highlight(client, bufnr)
    end,
    settings = { perl = { perlcritic = { enabled = true } } }
  }
)
