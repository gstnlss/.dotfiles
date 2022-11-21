local null_ls = require('null-ls');

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = "[#{c}] #{m} (#{s})"
        }), null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.code_actions.eslint_d
    }
})
