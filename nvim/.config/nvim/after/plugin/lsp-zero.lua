local lsp = require('lsp-zero')

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
lsp.skip_server_setup({ 'rust_analyzer', 'tsserver' })

-- Fix for react type definition files showing on go to definition
-- https://github.com/typescript-language-server/typescript-language-server/issues/216
local function filter(arr, fn)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.filename, 'react/index.d.ts') == nil
end

local function on_list(options)
  local items = options.items
  if #items > 1 then
    items = filter(items, filterReactDTS)
  end

  vim.fn.setqflist(
    {}, ' ', { title = options.title, items = items, context = options.context }
  )
  vim.cmd('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end

local custom_on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set(
    'n', 'gd', function()
      vim.lsp.buf.definition({ on_list = on_list })
    end, opts
  )
  vim.keymap.set(
    'n', '<leader>d', function()
      vim.diagnostic.open_float()
    end, opts
  )
  vim.keymap.set(
    'n', '[d', function()
      vim.diagnostic.goto_next()
    end, opts
  )
  vim.keymap.set(
    'n', ']d', function()
      vim.diagnostic.goto_prev()
    end, opts
  )
  vim.keymap.set(
    { 'n', 'v', 'x' }, '<leader>ca', function()
      vim.lsp.buf.code_action()
    end, opts
  )
  vim.keymap.set(
    'n', '<leader>rn', function()
      vim.lsp.buf.rename()
    end, opts
  )
  vim.keymap.set(
    'i', '<C-h>', function()
      vim.lsp.buf.signature_help()
    end, opts
  )

  vim.keymap.set(
    'n', '<leader>lr', function()
      vim.cmd('LspRestart')
    end
  )

  local lsp_format_on_save = vim.api.nvim_create_augroup(
    'LspFormatOnSave', { clear = false }
  )
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = lsp_format_on_save, buffer = bufnr })
    vim.api.nvim_create_autocmd(
      'BufWritePre', {
        group = lsp_format_on_save,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end
      }
    )
  end
end

lsp.on_attach(custom_on_attach)

lsp.configure(
  'lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
)

lsp.configure(
  'omnisharp', {
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = true,
    enable_import_completion = true,
    handlers = {
      ['textDocument/definition'] = require('omnisharp_extended').handler
    },
    on_attach = custom_on_attach
  }
)

lsp.nvim_workspace()
lsp.setup()

local typescript = require 'typescript'

local tsserver_config = lsp.build_options(
  'tsserver', {
    init_options = {
      preferences = { importModuleSpecifierPreference = 'non-relative' }
    },
    on_attach = function(client, bufnr)
      custom_on_attach(client, bufnr)

      vim.keymap.set(
        'n', '<leader>ti', function()
          typescript.actions.addMissingImports()
        end, { silent = true }
      );

      vim.keymap.set(
        'n', '<leader>tr', function()
          typescript.actions.removeUnused()
        end
      )

      vim.keymap.set(
        'n', '<leader>to', function()
          typescript.actions.organizeImports()
        end
      )
    end
  }
);

typescript.setup(
  {
    disable_commands = true,
    debug = false,
    go_to_source_definition = { fallback = true },
    server = tsserver_config
  }
)

local rust_analyzer_config = lsp.build_options(
  'rust_analyzer', { on_attach = custom_on_attach }
)
require('rust-tools').setup({ server = rust_analyzer_config })

vim.diagnostic.config({ virtual_text = true })
