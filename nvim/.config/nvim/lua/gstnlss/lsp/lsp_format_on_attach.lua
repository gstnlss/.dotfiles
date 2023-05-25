local lsp_format = require 'lsp-format'

local lsp_format_on_attach = function(client)
  if client.supports_method('textDocument/formatting') then
    lsp_format.on_attach(client)
  end
end

return lsp_format_on_attach
