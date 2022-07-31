vim.g.mapleader = " "

require('plugins')
require('globals')
require('lsp')
require('telescope_conf')
require('lualine_conf')

--==Config==--
vim.opt.list = true
vim.opt.listchars = "eol:↵,tab:| ,multispace:•••>"
vim.opt.expandtab = true

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
vim.cmd("colorscheme tokyonight")
