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

M.set_highlight = function(hi, colors)
	local hi_str = ""

	for k, v in pairs(colors) do
		hi_str = hi_str .. k .. "=" .. v .. " "
	end

	vim.cmd(("hi %s %s"):format(hi, hi_str))
end

M.get_highlight = function(hi)
	local hi_str = vim.api.nvim_command_output(("hi %s"):format(hi))

	local colors = {}
	for key, val in string.gmatch(hi_str, "(%w+)=(%S+)") do
		colors[key] = val
	end

	return colors
end
return M
