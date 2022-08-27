require("nvim-treesitter.configs").setup({
	ensure_installed = "",
	sync_install = false,
	auto_install = true,
	ignore_install = { "" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "python", "rust" } },
	autopairs = { enable = true },
	autotag = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		extended_mode = false,
		colors = { "#E5c07B", "#C678DD", "#56B6C2" },
		termcolors = { "lightblue", "lightyellow", "lightcyan", "lightmagenta" },
	},
})
