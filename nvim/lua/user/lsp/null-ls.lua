local null_ls = require("null-ls")
local utils = require("user.utils")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettierd.with({
			env = { PRETTIERD_LOCAL_PRETTIER_ONLY = 1 },
		}),
		formatting.stylua,
		formatting.prismaFmt,
		formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
		--[[ null_ls.builtins.formatting.deno_fmt, ]]

		diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
	},

	-- Format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			utils.enable_format_on_save(client, bufnr)
		end
	end,
})
