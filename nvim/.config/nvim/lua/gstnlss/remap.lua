-- Visual mode: move selected lines up/down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)

-- Quickfix list movement
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lprev<CR>zz')

-- Search & Replace in current file
vim.keymap.set('n', '<leader>rp',
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Close current buffer
vim.keymap.set('n', '<leader>x', function()
    local buffer_count = 0
    for buffer = 1, vim.fn.bufnr('$') do
        if vim.fn.buflisted(buffer) == 1 then
            buffer_count = buffer_count + 1
        end
    end

    local current_buffer = vim.fn.bufnr('%')
    if buffer_count > 1 then
        vim.cmd('bprevious')
        vim.cmd('bd#')
        print('[Info] Buffer ' .. current_buffer .. ' deleted.')
    else
        vim.cmd('bd%')
        print('[Info] Buffer ' .. current_buffer .. ' deleted.')
    end
end)

-- Quit vim even if splits are open
vim.keymap.set('n', '<leader>q', ':qall<CR>')
