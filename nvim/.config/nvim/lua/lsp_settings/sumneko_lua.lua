local lspconfig = require('lspconfig')
local on_attach = require('lsp_settings.utils').on_attach
local capabilities = require('lsp_settings.utils').capabilities

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup(
  {
    cmd = { 'lua-language-server', '-E' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT', path = runtime_path },
        diagnostics = { globals = { 'vim' } },
        workspace = { library = vim.api.nvim_get_runtime_file('', true) },
        telemetry = { enable = false }
      }
    }
  }
)
