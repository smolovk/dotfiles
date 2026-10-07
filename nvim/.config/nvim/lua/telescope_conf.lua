--== config for telescope.nvim ==--
require('telescope').load_extension('fzf')

local function map(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
end

local find_config = function()
    require('telescope.builtin').find_files {
        cwd = "~/.config/nvim"
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


map("<Leader>ff", find_files, "Find files (incl. ignored)")
map("<Leader>fc", find_config, "Find in nvim config")
map("<Leader>fn", find_notes, "Find in ~/notes")
map("<Leader>fg", require('telescope.builtin').live_grep, "Live grep")
map("<Leader>fs", require('telescope.builtin').colorscheme, "Colorscheme")
map("<Leader>fb", require('telescope.builtin').buffers, "Buffers")
map("<Leader>fh", require('telescope.builtin').help_tags, "Help tags")


