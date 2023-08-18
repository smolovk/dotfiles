local ls = require'luasnip'
local types = require'luasnip.util.types'

ls.config.set_config{
    history = true,

    updateevents = "TextChanged,TextChangedI",

    enable_autosnippets = true,
}


vim.keymap.set("i", "c-k", function ()
    if ls.expand_or_jumpable then
        ls.expand_or_jump()
    end
end, { silent = true })

ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "test")
    }
}

