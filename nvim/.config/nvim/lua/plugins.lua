return require('packer').startup(function(use)
    --==git plugins
    use 'wbthomason/packer.nvim'
    -- lsp
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
        --- Uncomment the two plugins below if you want to manage the language servers from neovim
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
      }
    }
    -- use 'neovim/nvim-lspconfig'
    -- use 'jose-elias-alvarez/null-ls.nvim'
    -- use 'MunifTanjim/eslint.nvim'
    -- use 'mfussenegger/nvim-dap'
    -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    -- -- use {
    -- --     "williamboman/mason.nvim",
    -- --     "williamboman/mason-lspconfig.nvim"
    -- -- }
    -- -- pico8
    -- use 'bakudankun/pico-8.vim'
    -- -- completion
    -- -- use 'hrsh7th/nvim-cmp'
    -- -- use 'hrsh7th/cmp-nvim-lsp'
    -- -- use 'hrsh7th/cmp-buffer'
    -- -- use 'hrsh7th/cmp-path'
    -- use 'L3MON4D3/LuaSnip'
    -- use 'rafamadriz/friendly-snippets'
    -- use 'saadparwaiz1/cmp_luasnip'
    -- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

    -- color schemes
    use { "catppuccin/nvim", as ="catppuccin" }
    use 'arcticicestudio/nord-vim'
    use 'folke/tokyonight.nvim'
    use "daschw/leaf.nvim"
    use "morhetz/gruvbox"

	  --lualine
    use 'kyazdani42/nvim-web-devicons'
  	use {
	    'nvim-lualine/lualine.nvim',
	    requires = { 'kyazdani42/nvim-web-devicons' }
	  }

    use 'scrooloose/nerdtree'
    use 'frazrepo/vim-rainbow'
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'
    use 'jiangmiao/auto-pairs'
    use 'folke/lsp-colors.nvim'
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
	use 'storyn26383/vim-vue'
    use 'APZelos/blamer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'smolovk/projector.nvim'

    -- tmux
    -- use 'christoomey/vim-tmux-navigator'

    -- local plugins
    -- use '/home/smolovk/code/lua/telescope.nvim'
    -- use '/home/smolovk/code/lua/projector.nvim'
end)
