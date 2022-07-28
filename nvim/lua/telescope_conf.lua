--== config for telescope.nvim ==--
local opts = { noremap = true, silent = true }

local find_config = function()
    require('telescope.builtin').find_files{
        cwd = "~/.config/nvim"
    }
end

vim.keymap.set("n", "<c-p>", require('telescope.builtin').find_files, opts)
vim.keymap.set("n", "<Leader>ff", require('telescope.builtin').find_files, opts)
-- find in dotfiles
vim.keymap.set("n", "<Leader>fc", find_config, opts)
vim.keymap.set("n", "<Leader>fg", require('telescope.builtin').live_grep, opts)
vim.keymap.set("n", "<Leader>fb", require('telescope.builtin').buffers, opts)
vim.keymap.set("n", "<Leader>fh", require('telescope.builtin').help_tags, opts)
