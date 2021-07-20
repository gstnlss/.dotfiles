local lspconfig = require('lspconfig')

local eslint_settings = {
    lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'},
    formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}',
    formatStdin = true
}

lspconfig.efm.setup({
    init_options = {documentFormatting = true},
    filetypes = {
        'lua', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'
    },
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            -- TODO: make up some better config for this lua-format
            lua = {{formatCommand = 'lua-format -i', formatStdin = true}},
            javascript = {eslint_settings},
            javascriptreact = {eslint_settings},
            typescript = {eslint_settings},
            typescriptreact = {eslint_settings}
        }
    }
})
