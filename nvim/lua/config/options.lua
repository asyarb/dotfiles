-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

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
vim.g.lazyvim_ts_lsp = "tsgo"
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_mini_snippets_in_completion = false
