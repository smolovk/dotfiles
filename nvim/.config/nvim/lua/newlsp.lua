local lsp = require("lspconfig")
require("mason").setup()

local cmp = require'cmp'

cmp.setup({
	snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body) -- For `luasnip` users
			end,
	},
	window = {
		completion = cmp.config.window.bordered()
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = false })
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})

-- local caps = require('blink.cmp').get_lsp_capabilities()
local caps = require('cmp_nvim_lsp').default_capabilities()

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
			diagnostics = {
				disable = { "undefined-global" }
			}
			-- diagnostics = {globals = {"vim", "use"}} -- set vim and use as globals
		}
	},
	capabilities = caps
}

lsp.clangd.setup({
	capabilities = caps
})

lsp.ts_ls.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
				languages = {"javascript", "typescript", "vue"},
			},
		},
	},
	filetypes = {
		"javascript",
		"typescript",
		"vue",
	},
	capabilities = caps,
})
