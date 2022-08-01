local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.load_extension("media_files")
telescope.load_extension("notify")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
		dynamic_preview_title = true,

		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
	},
})
