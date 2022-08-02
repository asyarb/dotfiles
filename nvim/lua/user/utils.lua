local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.enable_format_on_save = function(client, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
			vim.lsp.buf.formatting_sync()
		end,
	})
end

return M
