local lspconfig = require('lspconfig')
local on_attach = require('lsp_settings.utils').on_attach

local eslint_d = {
  lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m' },
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}',
  formatStdin = true
}

local prettier = {
  formatCommand = 'prettier --stdin --stdin-filepath ${INPUT}',
  formatStdin = true
}

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
    settings = {
      rootMarkers = { '.git/' },
      languages = {
        lua = { { formatCommand = 'lua-format -i', formatStdin = true } },
        javascript = { prettier, eslint_d },
        ['javascript.jsx'] = { prettier, eslint_d },
        javascriptreact = { prettier, eslint_d },
        typescript = { prettier, eslint_d },
        ['typescript.tsx'] = { prettier, eslint_d },
        typescriptreact = { prettier, eslint_d }
      }
    }
  }
)
