local lsp = require 'lsp-zero'
local on_attach = require 'gstnlss.lsp.on_attach'

lsp.configure(
  'omnisharp', {
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = true,
    enable_import_completion = true,
    handlers = {
      ['textDocument/definition'] = require('omnisharp_extended').handler
    },
    on_attach = on_attach
  }
)
