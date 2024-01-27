vim.g.mapleader = " "

require('plugins')
require('globals')
require('lspzero')
-- require('lsp')
-- require('tab9')
require('telescope_conf')
require('lualine_conf')
require('luasnip_conf')

--==Config==--
vim.opt.list = true
vim.opt.listchars = "tab:| ,multispace:•   "
-- vim.opt.listchars = "eol:↵,tab:| ,multispace:   •"
vim.opt.expandtab = true

require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ["foo.bar"] = "Identifier",
        },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
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
