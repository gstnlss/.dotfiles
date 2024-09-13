local lsp_utils = require('lspconfig.util')
local lsp_zero = require('lsp-zero')
local on_attach = require('gstnlss.lsp.on_attach').on_attach
local on_attach_definition =
  require('gstnlss.lsp.on_attach').on_attach_definition

lsp_zero.on_attach(
  function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr, exclude = { 'gr', 'gd' } })
    on_attach(client, bufnr)
    on_attach_definition(client, bufnr)
  end
)

local formatting_options = {
  format_opts = { async = false, timeout_ms = 10000 },
  servers = {
    ['efm'] = {
      'lua',
      'typescript',
      'typescriptreact',
      'javascript',
      'javascriptreact',
      'css'
    },
    ['jsonls'] = { 'json' },
    ['docker_compose_language_service'] = { 'yaml' }
  }
}

lsp_zero.format_on_save(formatting_options)
lsp_zero.format_mapping('<leader>f', formatting_options)

local lspconfig = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({ ui = { border = 'single' } })
require('mason-lspconfig').setup(
  {
    ensure_installed = {
      'ts_ls',
      'rust_analyzer',
      'omnisharp',
      'tailwindcss',
      'cssls',
      'jsonls',
      'html',
      'cssmodules_ls',
      'efm',
      'lua_ls',
      'bashls',
      'docker_compose_language_service'
    },
    handlers = {
      lsp_zero.default_setup,
      rust_analyzer = require 'gstnlss.lsp.rust',
      ts_ls = require 'gstnlss.lsp.typescript',
      omnisharp = require 'gstnlss.lsp.omnisharp',
      cssmodules_ls = function()
        lspconfig.cssmodules_ls.setup({ capabilities = capabilities })
      end,
      tailwindcss = function()
        lspconfig.tailwindcss.setup({ capabilities = capabilities })
      end,
      efm = require 'gstnlss.lsp.efm',
      bashls = function()
        lspconfig.bashls.setup({ filetypes = { 'sh', 'zsh' } })
      end,
      docker_compose_language_service = function()
        lspconfig.docker_compose_language_service.setup(
          {
            filetypes = { 'yaml' },
            root_dir = lsp_utils.root_pattern(
              'docker-compose.yaml', 'docker-compose.yml'
            ),
            single_file_support = true
          }
        )
      end
    }
  }
)

local cmp = require 'cmp'
local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format({})

cmp.setup(
  {
    sources = { { name = 'nvim_lsp' }, { name = 'buffer' }, { name = 'path' } },
    mapping = cmp.mapping.preset.insert(
      {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4)
      }
    ),
    formatting = cmp_format,
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    }
  }
)

-- Add borders to lsp related floating windows:
-- https://vi.stackexchange.com/questions/39074/user-borders-around-lsp-floating-windows
local border = 'single'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = border }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = border }
)

vim.diagnostic.config({ float = { border = border } })

require('lspconfig.ui.windows').default_options = { border = border }

