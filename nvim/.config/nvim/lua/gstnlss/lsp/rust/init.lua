local rust_tools = require 'rust-tools'
local on_attach = require'gstnlss.lsp.on_attach'.on_attach

return function()
  rust_tools.setup({ server = { on_attach = on_attach } })
end
