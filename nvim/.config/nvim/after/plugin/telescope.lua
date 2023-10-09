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
  'n', '<leader>sf', function()
    builtin.find_files({ hidden = true })
  end, {}
)
vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
vim.keymap.set(
  'n', '<leader>ss', function()
    local search = vim.fn.input('Grep > ')

    if (search ~= nil and search ~= '') then
      builtin.grep_string({ search = search })
    end
  end
)

vim.keymap.set('n', '<leader>sr', builtin.resume)
vim.keymap.set('n', '<leader>st', builtin.git_status)
