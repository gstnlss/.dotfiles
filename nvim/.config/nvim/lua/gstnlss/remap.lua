-- Visual mode: move selected lines up/down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>P', '"+P')

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>Y', '"+Y')

-- Quickfix list movement
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lprev<CR>zz')

-- Search & Replace in current file
local search_and_replace_cmd =
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
vim.keymap.set('n', '<leader>rp', search_and_replace_cmd)
vim.keymap.set('v', '<leader>rp', search_and_replace_cmd)

-- Close current buffer
vim.keymap.set(
  'n', '<leader>x', function()
    local buffer_count = 0
    for buffer = 1, vim.fn.bufnr('$') do
      if vim.fn.buflisted(buffer) == 1 then
        buffer_count = buffer_count + 1
      end
    end

    local should_save = vim.api.nvim_get_option_value('modified', { buf = 0 })
    if should_save then
      vim.cmd [[w]]
    end

    if buffer_count == 1 then
      vim.cmd [[bd]]
    else
      vim.cmd [[bp]]
      vim.cmd [[bd#]]
    end
  end
)

-- Close all buffers but current one
vim.keymap.set(
  'n', '<leader>re', function()
    vim.cmd [[%bd|e#]]

    local no_name_buf = vim.fn.bufnr('$')
    vim.api.nvim_buf_delete(no_name_buf, {})
  end
)

-- Quit vim even if splits are open
vim.keymap.set(
  'n', '<leader>q', function()
    vim.cmd [[NvimTreeClose]]
    vim.cmd [[wa]]
    vim.cmd [[qall!]]
  end
)
