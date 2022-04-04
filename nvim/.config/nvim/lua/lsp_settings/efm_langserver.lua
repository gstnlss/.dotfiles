local lspconfig = require('lspconfig')
local on_attach = require('lsp_settings.utils').on_attach

local eslint = {
  lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m' },
  formatCommand = 'eslint_d --stdin --fix-to-stdout --stdin-filename ${INPUT}',
  formatStdin = true,
  rootMarkers  = {
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    'package.json'
  }
}

local prettier = {
  formatCommand = 'prettier --stdin-filepath ${INPUT}',
  formatStdin = true,
  rootMarkers  = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.js',
    '.prettierrc.cjs',
    'prettier.config.js',
    'prettier.config.cjs',
    'prettier.toml',
  }
}

local lua_format = { formatCommand = 'lua-format -i', formatStdin = true }

local eslint_prettier_config = { prettier, eslint }

local root_markers = { '.git/' }

lspconfig.efm.setup(
  {
    init_options = { documentFormatting = true },
    on_attach = function(client)
      on_attach(client)
      client.resolved_capabilities.document_formatting = true
    end,
    filetypes = {
      'lua',
      'javascript',
      'javascript.jsx',
      'javascriptreact',
      'typescript',
      'typescript.tsx',
      'typescriptreact'
    },
    root_dir = lspconfig.util.root_pattern(unpack(root_markers)),
    settings = {
      rootMarkers = root_markers,
      languages = {
        lua = { lua_format },
        javascript = eslint_prettier_config,
        ['javascript.jsx'] = eslint_prettier_config,
        javascriptreact = eslint_prettier_config,
        typescript = eslint_prettier_config,
        ['typescript.tsx'] = eslint_prettier_config,
        typescriptreact = eslint_prettier_config
      }
    }
  }
)
