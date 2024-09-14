local lspconfig = require 'lspconfig'

local lua = {
  { formatCommand = 'lua-format -i', formatStdin = true },
  require 'efmls-configs.linters.luacheck'
}

local tsserver = {
  require 'efmls-configs.linters.eslint_d',
  require 'efmls-configs.formatters.prettier_d'
}

local css = { require 'efmls-configs.formatters.prettier_d' }

local terraform = { require 'efmls-configs.formatters.terraform_fmt' }

local yaml = { require 'efmls-configs.linters.yamllint' }

return function()
  lspconfig.efm.setup(
    {
      init_options = { documentFormatting = true },
      settings = {
        rootMarkers = { '.git/' },
        languages = {
          lua = lua,
          typescript = tsserver,
          typescriptreact = tsserver,
          javascript = tsserver,
          javascriptreact = tsserver,
          css = css,
          terraform = terraform,
          yaml = yaml
        }
      }
    }
  )
end

