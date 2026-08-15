return {
	-- Disable tabs
	{ "akinsho/bufferline.nvim", enabled = false },

	-- Disable inlay hints
	{
		"nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
		},
	},

	-- Disable news alerts
	{
		"LazyVim/LazyVim",
		opts = {
			news = {
				lazyvim = false,
				neovim = false,
			},
		},
	},
}
