local picker_config = { theme = 'dropdown', layout_config = { width = 0.6 } }

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
    },
    pickers = {
      find_files = picker_config,
      grep_string = picker_config,
      buffers = picker_config,
      git_files = picker_config,
      lsp_definitions = picker_config,
      lsp_references = picker_config
    }
  }
)

-- Display line numbers on previewer
vim.cmd [[autocmd User TelescopePreviewerLoaded setlocal number]]

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
vim.keymap.set('n', '<leader>sb', builtin.buffers)
