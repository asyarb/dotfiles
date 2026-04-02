---@type conform.FiletypeFormatterInternal
local prettier_compat = { "prettier", "oxfmt", stop_after_first = true }

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

			css = prettier_compat,
			typescriptreact = prettier_compat,
			typescript = prettier_compat,
			html = prettier_compat,
			javascript = prettier_compat,
		},
	},
}
