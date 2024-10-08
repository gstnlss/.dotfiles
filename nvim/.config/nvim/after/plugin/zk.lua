require('zk').setup(
  {
    picker = 'telescope',
    lsp = {
      config = { cmd = { 'zk', 'lsp' }, name = 'zk' },
      auto_attach = { enabled = true, filetypes = { 'markdown' } }
    }
  }
)

local opts = { noremap = true, silent = false }

vim.keymap.set(
  'n', '<leader>zn', function()
    local title = vim.fn.input('Title: ');

    if string.len(title) ~= 0 then
      vim.cmd(
        'ZkNew { dir = vim.fn.expand(\'$ZK_NOTEBOOK_DIR/notes\'), title = "' ..
          title .. '" }'
      )
    end

    -- '<Cmd>ZkNew { dir = vim.fn.expand(\'$ZK_NOTEBOOK_DIR/notes\'), title = vim.fn.input(\'Title: \') }<CR>'
  end, opts
)
vim.api.nvim_set_keymap(
  'n', '<leader>zj',
    '<Cmd>ZkNew { dir = vim.fn.expand(\'$ZK_NOTEBOOK_DIR/journal\') }<CR>', opts
)

local notebook_dir = vim.fn.environ().ZK_NOTEBOOK_DIR
vim.api.nvim_set_keymap(
  'n', '<leader>zf',
    '<Cmd>ZkNotes { sort = { \'modified\' }, hrefs = {"' .. notebook_dir ..
      '/notes"} }<CR>', opts
)

vim.api.nvim_set_keymap(
  'n', '<leader>zd',
    '<Cmd>ZkNotes { sort = { \'modified\' }, hrefs = {"' .. notebook_dir ..
      '/journal"} }<CR>', opts
)

