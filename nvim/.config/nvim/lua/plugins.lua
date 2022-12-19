-- Automatically bootstrap packer when first opening neovim in a new box
local install_path = vim.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    _G.packer_bootsrap = vim.fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

vim.cmd [[packadd packer.nvim]]

-- Automatically sync packer when this file is modified
local PACKER_CONFIG_AUGROUP = 'PackerUserConfig'
local packer_augroup_id = vim.api.nvim_create_augroup(PACKER_CONFIG_AUGROUP,
                                                      {clear = true})
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerSync',
    group = packer_augroup_id
})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'airblade/vim-gitgutter'
    use 'morhetz/gruvbox'
    use 'folke/lsp-colors.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        }
    }
    use {
        'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig'
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    use 'f-person/git-blame.nvim'

    use {'kkoomen/vim-doge', run = ':call doge#install()'}

    use 'windwp/nvim-autopairs'

    use {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require('lualine').setup({}) end
    }

    use 'epwalsh/obsidian.nvim'

    use 'mhinz/vim-startify'
    use 'tpope/vim-sleuth'
    use 'j-hui/fidget.nvim'

    if _G.packer_bootsrap then require('packer').sync() end
end)
