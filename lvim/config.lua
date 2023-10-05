-- Disable creating backup files.
vim.opt.backup = false

-- Disable persistent search highlights.
vim.opt.hlsearch = false

-- Persistent undo/redo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"

-- 4 space tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Relative Line Numbers
vim.opt.relativenumber = true

-- Scroll offset.
vim.opt.scrolloff = 8

-- Colors
vim.opt.termguicolors = true

-- Allow a longer period of time for commands to timeout.
vim.opt.timeoutlen = 500

-- Disable virtual text.
vim.diagnostic.config({ virtual_text = false })

-- Format on save.
lvim.format_on_save.enabled = true

-- Color scheme
lvim.colorscheme = "catppuccin"

-- Keymaps
lvim.leader = "space"

-- Pasting over a selection will not overrwrite your paste register.
lvim.keys.visual_mode["p"] = '"_dP'

-- File explorer will open the parent directory of current file.
lvim.keys.normal_mode["-"] = "<cmd>Oil<CR>"

-- Open git diff.
lvim.builtin.which_key.mappings["gd"] = {
	"<cmd>DiffviewOpen<CR>",
	"Git diffview",
}
-- Stage entire buffer
lvim.builtin.which_key.mappings["gS"] = {
	"<cmd>Gitsigns stage_buffer<CR>",
	"Stage Buffer",
}

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

-- Disable Tabs
lvim.builtin.bufferline.active = false

-- Disable Dashboard
lvim.builtin.alpha.active = false

-- Disable stupid filetree
lvim.builtin.nvimtree.active = false

-- Enable Rainbow Brackets
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.extended_mode = false

-- Lualine Configuration
lvim.builtin.lualine.options.theme = "catppuccin"

-- My Plugins
lvim.plugins = {
	-- Pope
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-abolish" },

	-- Utilites
	{ "christoomey/vim-tmux-navigator" },

	-- Git
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},

	-- Color Schemes
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				integrations = {
					telescope = {
						enabled = true,
					},
					lsp_trouble = true,
					ts_rainbow = true,
					treesitter = true,
					gitsigns = true,
					markdown = true,
					mason = true,
					cmp = true,
					notify = true,
					illuminate = true,
					which_key = true,
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
						inlay_hints = { background = true },
					},
					navic = {
						enabled = false,
						custom_bg = "NONE", -- "lualine" will set background to mantle
					},
				},
			})
		end,
	},

	-- Treesitter enhancements.
	{ "mrjones2014/nvim-ts-rainbow" },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufRead",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},

	-- Comment highlights for todo, fixme, etc.
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	-- Non-shitty file explorer
	{
		"stevearc/oil.nvim",
		opts = {
			delete_to_trash = true,
			trash_command = "trash",
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return vim.tbl_contains({ ".git" }, name)
				end,
			},
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}

-- Formatters
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
})

-- Linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		name = "eslint_d",
		condition = function(null_ls_utils)
			return null_ls_utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
		end,
	},
})

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- Let treesitter use bash highlight for zsh files as well
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
