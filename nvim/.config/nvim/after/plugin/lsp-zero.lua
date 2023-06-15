local lsp = require('lsp-zero')
local on_attach = require('gstnlss.lsp.on_attach')

lsp.preset(
  {
    name = 'recommended',
    set_lsp_keymaps = { omit = { '<F2>', '<F4>' } },
    manage_nvim_cmp = true,
    suggest_lsp_servers = true
  }
)
lsp.ensure_installed(
  {
    'bashls',
    'clangd',
    'cssmodules_ls',
    'cssls',
    'html',
    'jsonls',
    'lua_ls',
    'omnisharp',
    'rust_analyzer',
    'tailwindcss',
    'terraformls',
    'tflint',
    'tsserver',
    'zk'
  }
)
lsp.skip_server_setup(
  { 'rust_analyzer', 'tsserver', 'tailwindcss', 'cssmodules_ls' }
)
lsp.on_attach(on_attach)

require 'gstnlss.lsp.lua_ls'
require 'gstnlss.lsp.omnisharp'
require 'gstnlss.lsp.typescript'
require 'gstnlss.lsp.rust'

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({ virtual_text = true })
