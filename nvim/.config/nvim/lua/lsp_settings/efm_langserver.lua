local lspconfig = require('lspconfig')

lspconfig.efm.setup({
    init_options = {documentFormatting = true},
    filetypes = {'lua'},
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            -- TODO: make up some better config for this guy
            lua = {{formatCommand = 'lua-format -i', formatStdin = true}}
        }
    }
})
