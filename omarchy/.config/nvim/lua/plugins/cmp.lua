local ghost_text = false

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
			ghost_text = { enabled = ghost_text },
		},

		cmdline = {
			completion = { ghost_text = { enabled = ghost_text } },
		},

		sources = {
			default = { "lsp", "path" },
		},
	},
}
