vim.g.mapleader = " "

require('globals')
require('config.lazy')
require('newlsp')
require('telescope_conf')
require('lualine_conf')

--==Config==--
vim.o.tabstop = 4
vim.o.expandtab = false -- true = spaces, false = tabs
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.wo.number = true

vim.opt.list = true
vim.opt.listchars = "tab:| ,multispace:•   "
-- vim.opt.listchars = "eol:↵,tab:| ,multispace:   •"

require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

if package.config:sub(1,1) == "\\" then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
		cache_enabled = true,
	}
end

--==Key mappings==--
local opts = { noremap = true, silent = true }
--=developing
--execute current file
vim.keymap.set("n", "<Leader><Leader>x", ":w<cr>:source %<cr>", opts)

--==User Commands==--
--==AutoCommands==--
--==Plugins config==--

--= blamer.nvim
--enable blamer.nvim
vim.g.blamer_enabled = 1
--change delay to 200
vim.g.blamer_delay = 200

--==Color scheme==--
-- vim.cmd("colorscheme leaf")
-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme tokyonight")
