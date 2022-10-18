require'telescope'.setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      height = 0.95,
      prompt_position = 'top',
      preview_height = 0.7,
      mirror = true
    },
    vimgrep_arguments = {
      'rg',
      '--hidden',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-u' -- thats the new thing
    }
  },
  pickers = {
    find_files = { hidden = true, file_ignore_patterns = { '.git/' } },
    live_grep = { hidden = true, file_ignore_patters = { '.git/' } }
  }
}

local keymap_options = { noremap = true, silent = true }

vim.keymap.set('n', '<Leader>p', ':Telescope find_files<CR>', keymap_options)
vim.keymap.set('n', '<Leader>f', ':Telescope live_grep<CR>', keymap_options)
vim.keymap.set('n', '<Leader><tab>', ':Telescope buffers<CR>', keymap_options)
