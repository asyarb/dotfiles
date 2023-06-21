-- vim settings
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.undofile = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.textwidth = 80
vim.opt.foldlevel = 99

-- filetypes
vim.filetype.add({
	extension = {
		astro = "astro",
		css = "scss",
	},
})

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin"

vim.cmd([[ set showtabline=0 ]])

-- keymaps
lvim.leader = "space"
lvim.keys.normal_mode = {
	["-"] = function()
		require("nvim-tree").open_replacing_current_buffer()
	end,
}
lvim.keys.visual_mode = {
	["p"] = '"_dP', -- Pasting over a selection will not overrwrite your paste register.
}

-- lsp keymaps
lvim.lsp.buffer_mappings.normal_mode["rn"] = lvim.lsp.buffer_mappings.normal_mode["lr"]

-- leader keymaps
lvim.builtin.which_key.mappings["c"] = {}

-- Change Telescope navigation to use j and k for navigation and n and p for
-- history in both input and normal mode. we use protected-mode (pcall) just in
-- case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

-- user config for predefined plugins.
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.terminal.active = true

lvim.builtin.bufferline.active = false

lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.extended_mode = false
lvim.builtin.treesitter.rainbow.colors = { "#E5C07B", "#C678DD", "#56B6C2" }
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
	"php",
}
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.nvimtree.setup.filters.custom = {}
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.on_attach = function(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings. Feel free to modify or remove as you wish.
	-- BEGIN_DEFAULT_ON_ATTACH
	vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "<CR>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
	vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
	vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
	vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
	-- vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
	vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
	vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
	vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
	vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "%", api.fs.create, opts("Create"))
	vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
	vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
	vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
	vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
	vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
	-- vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
	vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
	vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
	vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
	vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
	vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
	vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
	vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
	vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
	vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
	vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "q", api.tree.close, opts("Close"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
	vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
	vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
	vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
	vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
	vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "Y", api.fs.copy.filename, opts("Copy Name"))
	vim.keymap.set("n", "c", api.fs.copy.relative_path, opts("Copy Relative Path"))
	vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
	-- END_DEFAULT_ON_ATTACH
end

-- Additional Plugins
lvim.plugins = {
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-abolish" },
	{ "christoomey/vim-tmux-navigator" },
	{ "jwalton512/vim-blade" },
	{ "amadeus/vim-mjml" },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
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
					nvimtree = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
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
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
				},
			})
		end,
	},

	{ "mrjones2014/nvim-ts-rainbow" },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				throttle = true,
				max_lines = 0,
				patterns = {
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
}

-- formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		name = "prettierd",
		env = { PRETTIERD_LOCAL_PRETTIER_ONLY = 1 },
		condition = function(null_ls_utils)
			return null_ls_utils.root_has_file({ "package.json" })
		end,
	},
	{ name = "stylua" },
	{ name = "pint" },
	{ name = "blade_formatter" },
})

-- linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		name = "eslint",
		condition = function(null_ls_utils)
			return null_ls_utils.root_has_file({ "package.json" })
		end,
	},
})

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
--
-- Let treesitter use bash highlight for zsh files as well
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
