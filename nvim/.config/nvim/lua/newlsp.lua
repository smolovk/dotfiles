local lsp = require("lspconfig")
require("mason").setup()

local caps = require('blink.cmp').get_lsp_capabilities()

vim.diagnostic.config{
	virtual_text = true
}

-- LSPs
lsp.pyright.setup{
	capabilities = caps
}

lsp.eslint.setup{}

lsp.lua_ls.setup{
	settings = {
		Lua = {
			diagnostics = {globals = {"vim", "use"}} -- set vim and use as globals
		}
	},
	capabilities = caps
}

lsp.clangd.setup({
	capabilities = caps
})
