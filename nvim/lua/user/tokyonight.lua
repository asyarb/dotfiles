require("tokyonight").setup({
	style = "night",
	sidebars = { "qf", "vista_kind", "terminal", "packer", "help", "Trouble" },
	dim_inactive = true,
	transparent = true,
})

local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
