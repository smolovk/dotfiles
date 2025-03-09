return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {'rafamadriz/friendly-snippets'},

  build = 'cargo +nightly build --release',

  opts = {
    keymap = { preset = 'super-tab' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

	cmdline = {enabled = false},
    fuzzy = {
		implementation = "rust",
	}
  },
  opts_extend = { "sources.default" }
}
