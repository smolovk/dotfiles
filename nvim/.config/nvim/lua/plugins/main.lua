-- prettierd is the daemon (fast); prettier is the fallback. conform picks the
-- project's node_modules copy before any global one.
local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
	'neovim/nvim-lspconfig',
	'mason-org/mason-lspconfig.nvim',
	'williamboman/mason.nvim',

	-- color schemes
	{ "catppuccin/nvim", name = "catppuccin" },
	'arcticicestudio/nord-vim',
	'folke/tokyonight.nvim',
	'rebelot/kanagawa.nvim',
	'loctvl842/monokai-pro.nvim',
	'sainnhe/everforest',

	--lualine
	'nvim-tree/nvim-web-devicons',
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true,
	},

	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		-- nvim-tree requires netrw off before it loads, else `nvim <dir>` races
		init = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		opts = {},
	},
	'folke/lsp-colors.nvim',
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		-- &shell is dash (fast system() calls); interactive terminals still want zsh
		opts = { shell = vim.env.SHELL or "/usr/bin/zsh" },
	},
	'romgrk/barbar.nvim',
	'mattn/emmet-vim',
	'tpope/vim-commentary',
	'tpope/vim-surround',
	'nvim-lua/plenary.nvim',
	{
		'nvim-treesitter/nvim-treesitter',
		build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		event = { "BufReadPost", "BufNewFile" },
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"c", "lua", "vim", "vimdoc", "query", "python", "go",
				"javascript", "typescript", "tsx", "vue", "html", "css",
				"json", "yaml", "bash", "markdown", "markdown_inline",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		},
	},
	-- treesitter-native rainbow parens (replaces the unmaintained frazrepo/vim-rainbow)
	{
		'HiPhish/rainbow-delimiters.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			current_line_blame = true,
			current_line_blame_opts = { delay = 200 },
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
	},
	{
		'stevearc/conform.nvim',
		event = "BufWritePre",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cf",
				function() require('conform').format({ async = true, lsp_format = "fallback" }) end,
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = prettier,
				javascriptreact = prettier,
				typescript = prettier,
				typescriptreact = prettier,
				vue = prettier,
				html = prettier,
				css = prettier,
				scss = prettier,
				json = prettier,
				yaml = prettier,
				markdown = prettier,
				python = { "ruff_format" },
				go = { "gofmt" },
			},
		},
	},
	{
		'folke/which-key.nvim',
		event = "VeryLazy",
		opts = {},
	},
	{
		'windwp/nvim-ts-autotag',
		ft = { "html", "vue", "javascriptreact", "typescriptreact", "markdown", "xml" },
		opts = {},
	},
	{
		'mbbill/undotree',
		cmd = "UndotreeToggle",
		keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" } },
	},
}
