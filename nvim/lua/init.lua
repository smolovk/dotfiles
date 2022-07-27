vim.g.mapleader = " "

require('plugins')
require('globals')
require('lsp')

--==Key mappings==--
local opts = { noremap = true, silent = true }
--=developing
--execute current file
vim.keymap.set("n", "<Leader><Leader>x", ":w<cr>:source %<cr>", opts)
--= telescope.nvim
vim.keymap.set("n", "<c-p>", require('telescope.builtin').find_files, opts)
vim.keymap.set("n", "<Leader>ff", require('telescope.builtin').find_files, opts)
vim.keymap.set("n", "<Leader>fg", require('telescope.builtin').live_grep, opts)
vim.keymap.set("n", "<Leader>fb", require('telescope.builtin').buffers, opts)
vim.keymap.set("n", "<Leader>fh", require('telescope.builtin').help_tags, opts)

--==Plugins config==--

--= blamer.nvim
--enable blamer.nvim
vim.g.blamer_enabled = 1
--change delay to 200
vim.g.blamer_delay = 200
