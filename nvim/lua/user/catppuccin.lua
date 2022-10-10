vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	integrations = {
		telescope = true,
		lsp_trouble = true,
		ts_rainbow = true,
		treesitter = true,
		gitsigns = true,
		markdown = true,
		cmp = true,
		notify = true,
		illuminate = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		neotree = {
			enabled = true,
			show_root = true, -- makes the root folder not transparent
			transparent_panel = false, -- make the panel transparent
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
})

vim.cmd([[colorscheme catppuccin]])
