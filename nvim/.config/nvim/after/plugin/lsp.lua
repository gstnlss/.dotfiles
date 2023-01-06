local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({ 'tsserver', 'sumneko_lua' })

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings(
    {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete()
    }
)

lsp.setup_nvim_cmp({ mapping = cmp_mappings })
lsp.set_preferences(
    { sign_icons = { error = 'E', warn = 'W', hint = 'H', info = 'I' } }
)

local null_ls = require('null-ls')
null_ls.setup(
    {
        diagnostics_format = '[#{c}] #{m} (${s})',
        sources = {
            null_ls.builtins.diagnostics.luacheck,
            null_ls.builtins.formatting.lua_format,
            null_ls.builtins.formatting.prettierd,
            null_ls.builtins.diagnostics.eslint_d,
            null_ls.builtins.formatting.eslint_d,
            null_ls.builtins.code_actions.eslint_d
        }
    }
)

local format_on_save_group = vim.api.nvim_create_augroup(
    'FormatOnSave', { clear = true }
)
lsp.on_attach(
    function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set(
            'n', 'gd', function()
                vim.lsp.buf.definition()
            end, opts
        )
        vim.keymap.set(
            'n', 'K', function()
                vim.lsp.buf.hover()
            end, opts
        )
        vim.keymap.set(
            'n', '<leader>vws', function()
                vim.lsp.buf.workspace_symbol()
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
            'n', '<leader>ca', function()
                vim.lsp.buf.code_action()
            end, opts
        )
        vim.keymap.set(
            'n', 'gr', function()
                vim.lsp.buf.references()
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

        -- Autoformatting
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd(
                'BufWritePre', {
                group = format_on_save_group,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end
            }
            )
            client.server_capabilities.documentFormattingProvider = true
        end
    end
)

lsp.setup()
require('fidget').setup()
