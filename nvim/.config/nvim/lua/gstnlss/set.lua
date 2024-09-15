vim.o.sessionoptions =
  'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.local/share/nvim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50

vim.opt.colorcolumn = '100'

vim.opt.mouse = ''

-- vim.opt.clipboard = 'unnamedplus'

vim.cmd [[filetype plugin on]]

-- System clipboard config for WSL2
-- local os_release = vim.uv.os_uname().release;
-- if os_release:find('WSL2') then
--   vim.opt.clipboard = {
--     name = 'WslClipboard',
--     copy = { ['+'] = 'clip.exe', ['*'] = 'clip.exe' },
--     paste = {
--       ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--       ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
--     },
--     cache_enabled = 0
--   }
-- end
