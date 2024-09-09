local typescript_tools = require('typescript-tools')
local on_attach = require'gstnlss.lsp.on_attach'.on_attach
local ts_on_attach = require 'gstnlss.lsp.typescript.on_attach'

return function()
  typescript_tools.setup(
    {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        ts_on_attach(client, bufnr)
      end,
      settings = {
        tsserver_file_preferences = {
          importModuleSpecifierPreference = 'non-relative'
        },
        jsx_close_tag = { enable = true }
      }
    }
  )
end
