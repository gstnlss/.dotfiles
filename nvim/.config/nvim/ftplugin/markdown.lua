vim.keymap.set('n', '<Leader>f', ':ObsidianSearch<CR>', { noremap = true })

vim.keymap.set('n', '<Leader>nn', ':ObsidianNew ', { noremap = true })
vim.keymap.set('n', '<Leader>o', ':ObsidianOpen<CR> ', { noremap = true })

vim.keymap.set(
  'n', 'gf', function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return '<cmd>ObsidianFollowLink<CR>'
    else
      return 'gf'
    end
  end, { noremap = false, expr = true }
)
