return {
	{
		"stevearc/conform.nvim",
		opts = {
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

			default_format_opts = {
				lsp_format = "never", -- not recommended to change
			},

			formatters_by_fmt = {
				lua = { "stylua" },
				fish = { "fish_indent" },
				sh = { "shfmt" },

				markdown = { "oxfmt", "prettierd", stop_after_first = true },
				javascript = { "oxfmt", "prettierd", stop_after_first = true },
				typescript = { "oxfmt", "prettierd", stop_after_first = true },
				typescriptreact = { "oxfmt", "prettierd", stop_after_first = true },
				json = { "oxfmt", "prettierd", stop_after_first = true },
				jsonc = { "oxfmt", "prettierd", stop_after_first = true },
				html = { "oxfmt", "prettierd", stop_after_first = true },
				svg = { "prettierd_svg" },
				css = { "oxfmt", "prettierd", stop_after_first = true },
				php = { "pint" },
				go = { "gofmt" },
			},
		},
	},
}
