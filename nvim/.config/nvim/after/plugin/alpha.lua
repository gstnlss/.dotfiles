local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
  dashboard.button('e', ' New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button(
    'g', '󰍉 Find file',
      ':lua require("telescope.builtin").find_files({ hidden = true })<CR>'
  ),
  dashboard.button('o', ' Recently opened files', ':Telescope oldfiles<CR>'),
  dashboard.button('l', ' Open last session', ':SessionRestore<CR>'),
  dashboard.button(
    's', ' Sessions',
      ':lua require("auto-session.session-lens").search_session()<CR>'
  ),
  dashboard.button('q', '󰩈 Quit NVIM', ':qa<CR>')
}
dashboard.config.opts.noautocmd = true

vim.cmd [[autocmd User AlphaReady echo 'ready']]

alpha.setup(dashboard.config)
