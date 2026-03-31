return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "BufEnter",
	config = function()
		vim.g.rainbow_delimiters = {
			query = {
				javascript = "rainbow-parens",
				tsx = "rainbow-parens",
			},
		}
	end,
}
