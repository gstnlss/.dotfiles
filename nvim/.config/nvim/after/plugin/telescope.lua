require('telescope').setup(
    {
        defaults = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--hidden'
            }
        }
    }
)

local builtin = require('telescope.builtin')

vim.keymap.set(
    'n', '<leader>pf', function()
    builtin.find_files({ hidden = true })
end, {}
)
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set(
    'n', '<leader>ps', function()
    local search = vim.fn.input('Grep > ')

    if (search ~= nil and search ~= '') then
        builtin.grep_string({ search = search })
    end
end
)
