local zk = require('zk')
local zk_util = require('zk.util');

if zk_util.notebook_root(vim.fn.expand('%:p')) ~= nil then
    require('telescope').load_extension('zk');

    local opts = { noremap = true, silent = false, buffer = 0 }
    local function map(keymap, fn)
        vim.keymap.set('n', keymap, fn, opts)
    end

    map(
        '<leader>zn', function()
        local title = vim.fn.input('Title > ')

        if (title ~= nil and title ~= '') then
            zk.new({ dir = 'notes', title = title });
        end
    end
    )

    map('<leader>zo', ':Telescope zk notes<CR>')
    map('<leader>zt', ':Telescope zk tags<CR>')
    map('<leader>zi', ':ZkIndex<CR>')
end
