require('plugins')
require('options')
require('lsp_settings')
require('keymaps')

local does_file_exist = require('utils').does_file_exist

local function get_node_neovim_path()
  local arch_path = '/usr/bin/neovim-node-host'
  local wsl_path = '/usr/local/bin/neovim-node-host'

  if (does_file_exist(arch_path)) then
    return arch_path
  else
    return wsl_path
  end
end

vim.api.nvim_set_var('python_host_prog', '/usr/bin/python2')
vim.api.nvim_set_var('python3_host_prog', '/usr/bin/python3')
vim.api.nvim_set_var('node_host_prog', get_node_neovim_path())

vim.api.nvim_set_var('NERDTreeGitStatusUseNerdFonts', 1)

-- " vim-airline
vim.api.nvim_set_var('airline_theme', 'base16_dracula')
vim.api.nvim_set_var('airline_powerline_fonts', 1)

-- custom/mine
vim.api.nvim_set_keymap('n', '<Leader>ss', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>sa', ':wa<CR>', { noremap = true })

-- TODO: move this to it's own file
require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = { '', '', '', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1
  },
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true
  }
}

require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
