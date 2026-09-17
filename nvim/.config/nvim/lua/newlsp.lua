require("mason").setup()

--==Completion==--
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer' },
	}),
})

-- cmp-path / cmp-cmdline were installed but unused; wire them to the cmdline
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = 'buffer' } },
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
})

vim.diagnostic.config({ virtual_text = true })

--==LSP keymaps==--
-- nvim 0.11 already provides K, grn (rename), gra (code action), grr (references),
-- gri (implementation), <C-s> (signature help). These fill the gaps.
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf, silent = true }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
	end,
})

--==LSP servers==--
-- mason-lspconfig v2 dropped `handlers`; servers are enabled via vim.lsp.enable().
-- Per-server tweaks go through vim.lsp.config.
vim.lsp.config('*', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.config('lua_ls', {
	settings = { Lua = { diagnostics = { disable = { "undefined-global" } } } },
})

-- vue_ls (Volar 3) runs hybrid-only: it owns template/CSS and forwards TS requests
-- over the `typescript.tsserverRequest` command. ts_ls does not implement that
-- command, so vtsls is the TS server here -- it is a superset of ts_ls.
vim.lsp.config('vtsls', {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = '@vue/typescript-plugin',
						location = vim.fn.stdpath('data')
							.. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
						languages = { 'vue' },
						configNamespace = 'typescript',
					},
				},
			},
		},
	},
})

require('mason-lspconfig').setup({
	ensure_installed = {
		'pyright', 'gopls', 'eslint', 'lua_ls', 'clangd', 'vtsls', 'vue_ls',
	},
})
