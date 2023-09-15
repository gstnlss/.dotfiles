local typescript = require 'typescript'
local on_attach = require'gstnlss.lsp.on_attach'.on_attach
local ts_on_attach = require 'gstnlss.lsp.typescript.on_attach'

return function()
  typescript.setup(
    {
      disable_commands = true,
      debug = false,
      go_to_source_definition = { fallback = true },
      server = {
        init_options = {
          preferences = { importModuleSpecifierPreference = 'non-relative' }
        },
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          ts_on_attach(client, bufnr)
        end
      }
    }
  )
end
