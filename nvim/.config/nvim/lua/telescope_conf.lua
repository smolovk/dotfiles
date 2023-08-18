--== config for telescope.nvim ==--
local opts = { noremap = true, silent = true }

local find_config = function()
    require('telescope.builtin').find_files {
        cwd = "~/dotfiles/nvim/.config/nvim"
    }
end

local find_notes = function()
    require('telescope.builtin').find_files {
        cwd = "~/notes"
    }
end

local find_files = function()
    require('telescope.builtin').find_files {
        no_ignore = true
    }
end


vim.keymap.set("n", "<c-p>", require('telescope.builtin').find_files, opts)
vim.keymap.set("n", "<Leader>ff", find_files, opts)
-- find in dotfiles
vim.keymap.set("n", "<Leader>fc", find_config, opts)
vim.keymap.set("n", "<Leader>fn", find_notes, opts)
vim.keymap.set("n", "<Leader>fg", require('telescope.builtin').live_grep, opts)
vim.keymap.set("n", "<Leader>fs", require('telescope.builtin').colorscheme, opts)
vim.keymap.set("n", "<Leader>fb", require('telescope.builtin').buffers, opts)
vim.keymap.set("n", "<Leader>fh", require('telescope.builtin').help_tags, opts)


