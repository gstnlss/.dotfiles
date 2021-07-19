-- TODO: move to own file
vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.cmdheight = 2
vim.o.updatetime = 200
vim.o.signcolumn = 'yes'
vim.o.wrap = false
vim.o.colorcolumn = '80'
vim.o.scrolloff = 10
vim.o.swapfile = false
vim.o.ignorecase = true
vim.cmd[[set shortmess+=c]]
vim.o.completeopt = 'menuone,noselect'

require('plugins')

vim.g.mapleader = ' '

-- " NERDTree
vim.api.nvim_set_keymap('n', '<Leader>nn', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', { noremap = true })
vim.api.nvim_set_var('NERDTreeGitStatusUseNerdFonts', 1)

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fm', ':Telescope man_pages<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fc', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope lsp_references<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fi', ':Telescope lsp_implementations<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fd', ':Telescope lsp_definitions<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>ca', ':Telescope lsp_code_actions<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cr', ':Telescope lsp_range_code_actions<CR>', { noremap = true })

-- " vim-fugitive
vim.api.nvim_set_keymap('n', '<Leader>gs', ':G<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Telescope git_branches<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Telescope git_commits<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gh', ':Telescope git_bcommits<CR>', { noremap = true })

-- " vim-airline
vim.api.nvim_set_var('airline_theme', 'gruvbox')
vim.api.nvim_set_var('airline_powerline_fonts', 1)

require('language_servers')

vim.cmd('colorscheme gruvbox')

-- custom/mine
vim.api.nvim_set_keymap('n', '<Leader>ss', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>sa', ':wa<CR>', { noremap = true })

-- TODO: move this to it's own file
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm({ "keys": "<CR>", "select": v:true })', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-f>', 'compe#scroll({ "delta": +4 })', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({ "delta": -4 })', { noremap = true, silent = true, expr = true })
