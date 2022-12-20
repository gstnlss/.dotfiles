-- Automatically bootstrap packer when first opening neovim in a new box
local install_path = vim.fn.stdpath('data') ..
    '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.cmd [[packadd packer.nvim]]
end

-- Automatically sync packer when this file is modified
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = vim.fn.expand '$MYVIMRC',
    command = 'source <afile> | PackerSync',
    group = packer_group
})

return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Color theme
    use 'morhetz/gruvbox'
    use 'folke/lsp-colors.nvim'

    -- Git utils
    use 'tpope/vim-fugitive'
    use 'f-person/git-blame.nvim'

    -- Commenting
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        }
    }

    -- LSP
    use {
        'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig'
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Pickers
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
    }

    -- Autocomplete
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    -- Comment generator
    use { 'kkoomen/vim-doge', run = ':call doge#install()' }

    -- Editor utils
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-sleuth'
    use 'tpope/vim-surround'

    -- UI
    use 'airblade/vim-gitgutter'
    use {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require('lualine').setup({}) end
    }
    use 'j-hui/fidget.nvim'
    use 'mhinz/vim-startify'

    if is_bootstrap then require('packer').sync() end
end)
