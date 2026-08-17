return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",
	opts = {
		keymap = { preset = "super-tab" },

		completion = { documentation = { auto_show = true } },
		signature = { enabled = true },

		fuzzy = { implementation = "prefer_rust_with_warning" },

		sources = {
			default = { "lsp", "buffer", "snippets", "path" },
			per_filetype = {
				sql = { "dadbod" },
			},
			providers = {
				dadbod = { module = "vim_dadbod_completion.blink" },
			},
		},
	},
	opts_extend = { "sources.default" },
}
