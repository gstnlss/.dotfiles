local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath
    }
  )
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  {
    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/playground',

    -- File navigation
    {
      'nvim-telescope/telescope.nvim',
      version = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'theprimeagen/harpoon',
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
        'nvim-tree/nvim-web-devicons' -- optional, for file icons
      }
    },

    -- Color theme
    { 'morhetz/gruvbox', name = 'gruvbox' },
    {
      'folke/tokyonight.nvim',
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
        vim.cmd('colorscheme tokyonight-moon')
      end
    },

    -- Git
    'tpope/vim-fugitive',
    'airblade/vim-gitgutter',
    'f-person/git-blame.nvim',

    -- Editor
    'mbbill/undotree',
    'tpope/vim-surround',
    'tpope/vim-sleuth',
    'windwp/nvim-autopairs',

    -- LSP
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', lazy = true, config = false },
    { 'neovim/nvim-lspconfig', dependencies = { { 'hrsh7th/cmp-nvim-lsp' } } },
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        { 'L3MON4D3/LuaSnip' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' }
      }
    },
    -- General Purpose LSP
    { 'lukas-reineke/lsp-format.nvim' },
    'jose-elias-alvarez/typescript.nvim',
    'simrat39/rust-tools.nvim',
    'Hoffs/omnisharp-extended-lsp.nvim',
    {
      'creativenull/efmls-configs-nvim',
      version = 'v1.x.x',
      dependencies = { 'neovim/nvim-lspconfig' }
    },

    -- UI/UX
    'nvim-lualine/lualine.nvim',
    {
      'akinsho/bufferline.nvim',
      version = 'v3.*',
      dependencies = 'nvim-tree/nvim-web-devicons'
    },
    'rmagatti/auto-session',
    'petertriho/nvim-scrollbar',
    { 'goolord/alpha-nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

    -- Commenting
    'numToStr/Comment.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'kkoomen/vim-doge'
  }
)
