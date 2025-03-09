return {
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',

	-- color schemes
	{ "catppuccin/nvim", as ="catppuccin" },
	'arcticicestudio/nord-vim',
	'folke/tokyonight.nvim',
	"daschw/leaf.nvim",
	"morhetz/gruvbox",
	'comfysage/evergarden',

	--lualine
	'nvim-tree/nvim-web-devicons',
	{
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons' }
	},

	'scrooloose/nerdtree',
	'frazrepo/vim-rainbow',
	-- 'vim-airline/vim-airline'
	-- 'vim-airline/vim-airline-themes'
	'jiangmiao/auto-pairs',
	'folke/lsp-colors.nvim',
	{'akinsho/toggleterm.nvim', version = "*", config = true},
	'romgrk/barbar.nvim',
	'mattn/emmet-vim',
	'tpope/vim-commentary',
	'tpope/vim-surround',
	'nvim-lua/plenary.nvim',
	{
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	},
	'storyn26383/vim-vue',
	'APZelos/blamer.nvim',
	{
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
}
