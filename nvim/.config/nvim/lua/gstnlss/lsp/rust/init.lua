local lsp = require 'lsp-zero'
local rust_tools = require 'rust-tools'
local on_attach = require 'gstnlss.lsp.on_attach'

local rust_analyzer_config = lsp.build_options(
  'rust_analyzer', { on_attach = on_attach }
)

rust_tools.setup({ server = rust_analyzer_config })
