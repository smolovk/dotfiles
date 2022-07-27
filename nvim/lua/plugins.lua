return require('packer').startup(function()
    -- git plugins
    use 'wbthomason/packer.nvim'
    use 'arcticicestudio/nord-vim'
    use 'scrooloose/nerdtree'
    use 'frazrepo/vim-rainbow'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'jiangmiao/auto-pairs'
    use 'folke/lsp-colors.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {'akinsho/toggleterm.nvim', tag = 'v1.*'}
    use 'vim-ctrlspace/vim-ctrlspace'
    use 'romgrk/barbar.nvim'
    use 'mattn/emmet-vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'APZelos/blamer.nvim'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- use 'smolovk/projector.nvim'

    -- local plugins
    use '/home/smolovk/code/lua/projector.nvim'
end)
