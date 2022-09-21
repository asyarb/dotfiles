require("tokyonight").setup({
	style = "night",
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
