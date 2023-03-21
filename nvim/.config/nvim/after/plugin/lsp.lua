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
lsp.skip_server_setup({ 'rust_analyzer' })

local null_ls = require('null-ls')
null_ls.setup(
    {
        diagnostics_format = '[#{c}] #{m} (#{s})',
        sources = {
            null_ls.builtins.diagnostics.luacheck,
            null_ls.builtins.formatting.lua_format,
            null_ls.builtins.formatting.prettierd,
            null_ls.builtins.diagnostics.eslint_d,
            null_ls.builtins.formatting.eslint_d,
            null_ls.builtins.code_actions.eslint_d,
            require('typescript.extensions.null-ls.code-actions'),
            null_ls.builtins.diagnostics.terraform_validate,
            null_ls.builtins.diagnostics.yamllint,
            null_ls.builtins.formatting.packer,
            null_ls.builtins.formatting.rustfmt,
            null_ls.builtins.formatting.terraform_fmt
        }
    }
)

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

local format_on_save_group = vim.api.nvim_create_augroup(
    'FormatOnSave', { clear = true }
)
lsp.on_attach(
    function(client, bufnr)
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
        }
    }
)

lsp.nvim_workspace()
lsp.setup()

local rust_lsp = lsp.build_options('rust_analyzer')
require('rust-tools').setup({ server = rust_lsp })

vim.diagnostic.config({ virtual_text = true })
