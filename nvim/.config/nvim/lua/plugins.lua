vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function(use)
    use 'wbthomason/packer.nvim'
    use 'airblade/vim-gitgutter'
    use 'morhetz/gruvbox'
    use 'folke/lsp-colors.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons' -- optional, for file icons
      }
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'neovim/nvim-lspconfig'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
    }
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    use 'f-person/git-blame.nvim'

    use { 'kkoomen/vim-doge', run = ':call doge#install()' }

    use 'windwp/nvim-autopairs'

    use {
      'akinsho/bufferline.nvim',
      tag = 'v2.*',
      requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require('lualine').setup({})
      end
    }

    use 'rmagatti/auto-session'
    use 'mickael-menu/zk-nvim'
  end
)
