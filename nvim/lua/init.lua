vim.g.mapleader = " "

require('plugins')
require('globals')

--==Key mappings==--
--=developing
--execute current file
vim.api.nvim_set_keymap("n", "<Leader><Leader>x", ":w<cr>:source %<cr>", { noremap = true, silent = true })
--= telescope.nvim
vim.api.nvim_set_keymap("n", "<c-p>", ":lua require('telescope.builtin').find_files() <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ff", ":lua require('telescope.builtin').find_files() <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep() <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fb", ":lua require('telescope.builtin').buffers() <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", ":lua require('telescope.builtin').help_tags() <CR>", { noremap = true, silent = true })

--==Plugins config==--

--= blamer.nvim
--enable blamer.nvim
vim.g.blamer_enabled = 1
--change delay to 200
vim.g.blamer_delay = 200
