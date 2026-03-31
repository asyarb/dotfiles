return {
	"stevearc/conform.nvim",

	---@module 'conform'
	---@type conform.setupOpts
	opts = {
		default_format_opts = {
			lsp_format = "never",
		},

		formatters = {
			prettierd = {
				require_cwd = true,
			},
			prettierd_svg = {
				command = "prettierd",
				require_cwd = true,
				args = function(_self, ctx)
					return { ctx.filename, "--parser=html" } -- Note: filename and parser format
				end,
			},
		},

		formatters_by_ft = {
			lua = { "stylua" },
			fish = { "fish_indent" },
			sh = { "shfmt" },
			php = { "pint" },
			go = { "gofmt" },

			markdown = { "oxfmt", "prettierd", stop_after_first = true },
			javascript = { "oxfmt", "prettierd", stop_after_first = true },
			typescript = { "oxfmt", "prettierd", stop_after_first = true },
			typescriptreact = { "oxfmt", "prettierd", stop_after_first = true },
			json = { "oxfmt", "prettierd", stop_after_first = true },
			jsonc = { "oxfmt", "prettierd", stop_after_first = true },
			html = { "oxfmt", "prettierd", stop_after_first = true },
			svg = { "prettierd_svg" },
			css = { "oxfmt", "prettierd", stop_after_first = true },
		},
	},
}
