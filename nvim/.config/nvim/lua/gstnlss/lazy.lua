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
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', version = 'v0.9.*' },
    'nvim-treesitter/playground',

    -- File navigation
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      'theprimeagen/harpoon',
      branch = 'harpoon2',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
        'nvim-tree/nvim-web-devicons' -- optional, for file icons
      }
    },

    {
      'folke/tokyonight.nvim',
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
        vim.cmd('colorscheme tokyonight-night')
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
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x', lazy = true },
    { 'neovim/nvim-lspconfig', dependencies = { { 'hrsh7th/cmp-nvim-lsp' } } },
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = { { path = 'luvit-meta/library', words = { 'vim%.uv' } } }
      }
    },
    { 'Bilal2453/luvit-meta', lazy = true },
    {
      'hrsh7th/nvim-cmp',
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, { name = 'lazydev', group_index = 0 })
      end,
      dependencies = {
        {
          'L3MON4D3/LuaSnip',
          version = 'v2.*',
          build = 'make install_jsregexp',
          dependencies = { 'rafamadriz/friendly-snippets' }
        },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' }
      }
    },
    -- LSP
    {
      'pmizio/typescript-tools.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
      opts = {}
    },
    'simrat39/rust-tools.nvim',
    'Hoffs/omnisharp-extended-lsp.nvim',
    {
      'creativenull/efmls-configs-nvim',
      version = 'v1.x.x',
      dependencies = { 'neovim/nvim-lspconfig' }
    },
    { 'zk-org/zk-nvim' },

    -- UI/UX
    'nvim-lualine/lualine.nvim',
    {
      'akinsho/bufferline.nvim',
      version = '*',
      dependencies = 'nvim-tree/nvim-web-devicons'
    },
    'rmagatti/auto-session',
    'petertriho/nvim-scrollbar',

    -- Commenting
    'numToStr/Comment.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring'
  }, { ui = { border = 'single' } }
)
