return {
	"stevearc/conform.nvim",

	---@module 'conform'
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			fish = { "fish_indent" },
			sh = { "shfmt" },
			php = { "pint" },
			go = { "gofmt" },
		},
	},
}
