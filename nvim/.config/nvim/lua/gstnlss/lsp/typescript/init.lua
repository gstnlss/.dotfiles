local lsp = require 'lsp-zero'
local typescript = require 'typescript'
local on_attach = require 'gstnlss.lsp.on_attach'
local ts_on_attach = require 'gstnlss.lsp.typescript.on_attach'

local tsserver_config = lsp.build_options(
  'tsserver', {
    init_options = {
      preferences = { importModuleSpecifierPreference = 'non-relative' }
    },
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      ts_on_attach(client, bufnr)
    end
  }
);

typescript.setup(
  {
    disable_commands = true,
    debug = false,
    go_to_source_definition = { fallback = true },
    server = tsserver_config
  }
)
