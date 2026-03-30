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
}
