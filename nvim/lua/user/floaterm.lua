local utils = require("user.utils")
local g = vim.g
local title = vim.env.SHELL
local set

g.floaterm_width = 0.7
g.floaterm_height = 0.8
g.floaterm_title = "[" .. title .. "]:($1/$2)"
g.floaterm_borderchars = "─│─│╭╮╯╰"
g.floaterm_opener = "vsplit"

utils.set_highlight("FloatBorder", {
	guibg = "None",
})

vim.cmd("hi! link FloatermBorder FloatBorder")
