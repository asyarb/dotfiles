return {
	"saghen/blink.cmp",
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},

		completion = {
			list = { selection = { preselect = true, auto_insert = false } },
		},

		sources = {
			default = { "lsp", "path" },
		},
	},
}
