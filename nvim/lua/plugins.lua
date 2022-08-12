return require('packer').startup(function(use)
    --==git plugins
    use 'wbthomason/packer.nvim'
    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/eslint.nvim'
    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'

    -- color schemes
    use 'arcticicestudio/nord-vim'
    use 'folke/tokyonight.nvim'
    use 'rafi/awesome-vim-colorschemes'

	  --lualine
  	use {
	    'nvim-lualine/lualine.nvim',
	    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	  }

    use 'scrooloose/nerdtree'
    use 'frazrepo/vim-rainbow'
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'
    use 'jiangmiao/auto-pairs'
    use 'folke/lsp-colors.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
        require("toggleterm").setup()
    end}
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
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'smolovk/projector.nvim'

    -- local plugins
    -- use '/home/smolovk/code/lua/telescope.nvim'
    -- use '/home/smolovk/code/lua/projector.nvim'
end)
