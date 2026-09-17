vim.g.mapleader = " "

-- nvim's system()/jobstart use &shell; $SHELL is zsh and ~/.zshenv sources nvm.sh
-- (~390ms per spawn). Every git-calling autocmd paid that. nvim needs no zsh.
vim.o.shell = "/bin/dash"

-- Pin the clipboard tool: without this nvim probes xclip/xsel/wl-copy/win32yank
-- across a $PATH with 24 /mnt/c entries (~500ms) on every start.
if vim.fn.has("wsl") == 1 then
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
vim.o.smartcase = true  -- with ignorecase: /foo matches any case, /Foo is exact
vim.o.undofile = true   -- undo history survives restart

vim.opt.list = true
vim.opt.listchars = "tab:| ,multispace:•   "
-- vim.opt.listchars = "eol:↵,tab:| ,multispace:   •"

--==Harpoon==--
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>q", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>w", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>e", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():select(4) end)

--==Key mappings==--
local opts = { noremap = true, silent = true }
--=developing
--execute current file
vim.keymap.set("n", "<Leader><Leader>x", ":w<cr>:source %<cr>", opts)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
--==User Commands==--
--==AutoCommands==--
--==Plugins config==--

--==Color scheme==--
vim.cmd("colorscheme everforest")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme tokyonight")
--
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*.org",
  command = "checktime",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})
