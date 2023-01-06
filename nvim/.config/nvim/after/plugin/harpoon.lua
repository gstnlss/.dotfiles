local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu)

local MAX_MARKS = 5;

for i = 1, MAX_MARKS do
    vim.keymap.set(
        'n', '<leader>h' .. i, function()
        mark.set_current_at(i)
    end
    )
    vim.keymap.set(
        'n', '<leader>' .. i, function()
        ui.nav_file(i)
    end
    )
    vim.keymap.set(
        'n', '<leader>hd' .. i, function()
        mark.rm_file(i)
    end
    )
end
