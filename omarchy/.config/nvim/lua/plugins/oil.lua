return {
	{
		"stevearc/oil.nvim",

		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			default_file_explorer = true,
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return vim.tbl_contains({ ".git", ".DS_Store" }, name)
				end,
			},
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
			},
		},
		init = function()
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
	{
		"malewicz1337/oil-git.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {
			show_file_highlights = true,
			show_directory_highlights = false,
			show_ignored_files = true,
		},
	},
}
