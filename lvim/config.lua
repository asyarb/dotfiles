-- vim settings
vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.hlsearch = false
vim.opt.undofile = true
vim.opt.showtabline = 0
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.colorcolumn = "99999"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.textwidth = 80
vim.opt.formatoptions = "cqj"
vim.opt.updatetime = 300 -- faster completion

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
lvim.builtin.nvimtree.setup.view.mappings.list = {
	{ key = "<CR>", action = "edit_in_place" },
	{ key = "%", action = "create" },
	{ key = "d", action = "create" },
	{ key = "D", action = "remove" },
	{ key = "p", action = "paste" },
	{ key = "y", action = "copy" },
}

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
