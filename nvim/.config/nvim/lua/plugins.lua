vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function(use)
    use 'wbthomason/packer.nvim'
    use 'airblade/vim-gitgutter'
    use 'morhetz/gruvbox'
    use 'folke/lsp-colors.nvim'
    use 'preservim/nerdtree'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'Xuyuanp/nerdtree-git-plugin'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'ryanoasis/vim-devicons'
    use 'neovim/nvim-lspconfig'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
    }
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    use 'f-person/git-blame.nvim'
  end
)
