local lspconfig = require('lspconfig')
local lsp_settings_utils = require('lsp_settings.utils')
local on_attach = lsp_settings_utils.on_attach
local capabilities = lsp_settings_utils.capabilities

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup(
  {
    cmd = { 'lua-language-server', '-E' },
    on_attach = function(client, bufnr)
      on_attach.lsp_keymaps(client, bufnr)
      on_attach.highlight(client, bufnr)
      on_attach.disable_formatting(client)
    end,
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
