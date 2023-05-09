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
    'ansiblels',
    'bashls',
    'clangd',
    'cssmodules_ls',
    'cssls',
    'docker_compose_language_service',
    'dockerls',
    'html',
    'jsonls',
    'ltex',
    'lua_ls',
    'omnisharp',
    'pyright',
    'rust_analyzer',
    'tailwindcss',
    'taplo',
    'terraformls',
    'tflint',
    'tsserver',
    'vimls',
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
