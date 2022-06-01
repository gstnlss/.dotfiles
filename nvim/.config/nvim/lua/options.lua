-- Default tabs settings
vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Case insensitive search UNLESS /C or capital letter in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 200
vim.wo.signcolumn = 'yes'

-- Color scheme (order matters)
vim.o.termguicolors = true
vim.g.gruvbox_contrast_dark = "hard"
vim.cmd('colorscheme gruvbox')

-- Always keep 10 lines above/below the cursor visible
vim.o.scrolloff = 10

-- Highlight cursor line
vim.o.cursorline = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Turn off backup files
vim.o.backup = false
vim.o.writebackup = false

-- Make cmd line bigger
vim.o.cmdheight = 2

-- Do not wrap lines that are too long
vim.o.wrap = false

-- 80 Chars indicator
vim.o.colorcolumn = '80'

-- Disable swap file
vim.o.swapfile = false

-- Disable completion messages
vim.cmd [[set shortmess+=c]]

-- Use popup menu always, do not select match in menu, do not insert text until selected
-- vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.completeopt = 'menu,menuone,noselect'
