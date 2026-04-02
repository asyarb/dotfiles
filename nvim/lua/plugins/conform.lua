---@type conform.FiletypeFormatterInternal
local js = { "prettier", "oxfmt", stop_after_first = true }

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

			css = js,
			typescriptreact = js,
			typescript = js,
			html = js,
			javascript = js,
			json = js,
		},
	},
}
