local harpoon = require('harpoon')

harpoon:setup()

vim.keymap.set(
  'n', '<leader>ha', function()
    harpoon:list():append()
  end
)
vim.keymap.set(
  'n', '<leader>hh', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end
)

local MAX_MARKS = 5;
for i = 1, MAX_MARKS do
  vim.keymap.set(
    'n', '<leader>' .. i, function()
      harpoon:list():select(i)
    end
  )
end
