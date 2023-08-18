-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local bufopts = { noremap=true, silent=true, buffer=0 }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- diagnostic nav
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, bufopts)
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, bufopts)
vim.keymap.set('n', '<leader>ld', require('telescope.builtin').diagnostics, bufopts)

local on_attach = function ()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
end



--== Config for servers ==--
require'lspconfig'.pyright.setup{}

require'lspconfig'.eslint.setup{}

require'lspconfig'.vuels.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
            globals = {"vim", "event", "battery", "camera", "console", "constants", "display", "dryos", "global", "interval", "key", "lens", "lv", "menu", "movie", "property", "task", "config", "keys", "logger", "KEY"},
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
        },
    },
}

require'null-ls'
require'eslint'.setup({
  bin = 'eslint',
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})



--==Completion==--
vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
},
window = {
-- completion = cmp.config.window.bordered(),
-- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
}, {
    { name = 'buffer' },
})
})

