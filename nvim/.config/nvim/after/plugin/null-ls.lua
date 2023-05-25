local null_ls = require 'null-ls'
local lsp_format_on_attach = require 'gstnlss.lsp.lsp_format_on_attach'

null_ls.setup(
  {
    on_attach = lsp_format_on_attach,
    diagnostics_format = '[#{c}] #{m} (#{s})',
    sources = {
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.formatting.lua_format
    }
  }
)
