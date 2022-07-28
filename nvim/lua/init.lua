vim.g.mapleader = " "

require('plugins')
require('globals')
require('lsp')
require('telescope_conf')

--==Key mappings==--
local opts = { noremap = true, silent = true }
--=developing
--execute current file
vim.keymap.set("n", "<Leader><Leader>x", ":w<cr>:source %<cr>", opts)

--==User Commands==--

-- vim.api.nvim_create_user_command(
--   "PrEdit",
--   function(conf)
--     require('projector').edit(conf.args)
--   end,
--   { nargs=1 }
-- )

-- vim.api.nvim_create_user_command(
--   "PrLoad",
--   function(conf)
--     require('projector').load(conf.args)
--   end,
--   { nargs=1 }
-- )
--==Plugins config==--

--= blamer.nvim
--enable blamer.nvim
vim.g.blamer_enabled = 1
--change delay to 200
vim.g.blamer_delay = 200
