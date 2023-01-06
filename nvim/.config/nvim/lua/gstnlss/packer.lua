vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function(use)
        use('wbthomason/packer.nvim')
        -- Treesitter
        use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
        use('nvim-treesitter/playground')

        -- File navigation
        use(
            {
                'nvim-telescope/telescope.nvim',
                tag = '0.1.0',
                requires = { { 'nvim-lua/plenary.nvim' } }
            }
        )
        use('theprimeagen/harpoon')
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons' -- optional, for file icons
            }
        }

        -- Color theme
        use(
            {
                'morhetz/gruvbox',
                as = 'gruvbox',
                config = function()
                    vim.cmd('colorscheme gruvbox')
                end
            }
        )

        -- Git
        use('tpope/vim-fugitive')
        use('airblade/vim-gitgutter')

        -- Editor
        use('mbbill/undotree')
        use('tpope/vim-surround')
        use('tpope/vim-sleuth')
        use('windwp/nvim-autopairs')

        -- LSP
        use(
            {
                'VonHeikemen/lsp-zero.nvim',
                requires = {
                    -- LSP Support
                    { 'neovim/nvim-lspconfig' },
                    { 'williamboman/mason.nvim' },
                    { 'williamboman/mason-lspconfig.nvim' }, -- Autocompletion
                    { 'hrsh7th/nvim-cmp' },
                    { 'hrsh7th/cmp-buffer' },
                    { 'hrsh7th/cmp-path' },
                    { 'saadparwaiz1/cmp_luasnip' },
                    { 'hrsh7th/cmp-nvim-lsp' },
                    { 'hrsh7th/cmp-nvim-lua' }, -- Snippets
                    { 'L3MON4D3/LuaSnip' }, -- Snippet Collection (Optional)
                    { 'rafamadriz/friendly-snippets' }
                }
            }
        )
        use(
            {
                'jose-elias-alvarez/null-ls.nvim',
                requires = { { 'nvim-lua/plenary.nvim' } }
            }
        )
        use('j-hui/fidget.nvim')

        -- UI/UX
        use('nvim-lualine/lualine.nvim')
        use(
            {
                'akinsho/bufferline.nvim',
                tag = 'v3.*',
                requires = 'nvim-tree/nvim-web-devicons'
            }
        )
        use('rmagatti/auto-session')

        -- Commenting
        use('numToStr/Comment.nvim')
        use('JoosepAlviste/nvim-ts-context-commentstring')
    end
)
