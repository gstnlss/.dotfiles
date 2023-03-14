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
        {
            'morhetz/gruvbox',
            name = 'gruvbox',
            config = function()
                vim.cmd('colorscheme gruvbox')
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
        {
            'VonHeikemen/lsp-zero.nvim',
            dependencies = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },
                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },
                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                -- Snippet Collection (Optional)
                { 'rafamadriz/friendly-snippets' }
            }
        },
        {
            'jose-elias-alvarez/null-ls.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        'mickael-menu/zk-nvim',
        'Hoffs/omnisharp-extended-lsp.nvim',
        'simrat39/rust-tools.nvim',
        'jose-elias-alvarez/typescript.nvim',

        -- UI/UX
        'nvim-lualine/lualine.nvim',
        {
            'akinsho/bufferline.nvim',
            version = 'v3.*',
            dependencies = 'nvim-tree/nvim-web-devicons'
        },
        'rmagatti/auto-session',
        'petertriho/nvim-scrollbar',

        -- Commenting
        'numToStr/Comment.nvim',
        'JoosepAlviste/nvim-ts-context-commentstring'
    }
)
