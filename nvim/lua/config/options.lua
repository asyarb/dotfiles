-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use HTML Treesitter highlighting for MJML files.
vim.filetype.add({
	extension = {
		mjml = "html",
	},
})

-- Tab size of 3.
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3

-- Disable animations
vim.g.snacks_animate = false

-- Softwrap lines
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Remove tab visualizations
vim.opt.list = false

-- LazyVim
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_mini_snippets_in_completion = false
vim.opt_local.spell = false

-- Enable WSL system clipboard
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = { ["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf" },
		paste = { ["+"] = "win32yank.exe -o --lf", ["*"] = "win32yank.exe -o --lf" },
		cache_enabled = true,
	}
end
