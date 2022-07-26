local o = vim.opt
local fn = vim.fn

-- Global Settings
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true
o.smartindent = true
o.undofile = true
o.cursorline = true
o.number = true
o.relativenumber = true
o.wrap = false
o.signcolumn = 'yes'
o.undodir = fn.expand('~') .. '/.nvim/undodir'
o.hidden = true
o.joinspaces = false
o.scrolloff = 8
o.sidescrolloff = 8
o.shiftround = true
o.splitbelow = true
o.splitright = true
o.updatetime = 50
o.errorbells = false
o.swapfile = false
o.backup = false
o.writebackup = false
o.cmdheight = 1
o.hlsearch = false
o.incsearch = true
o.foldmethod = "expr"
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldlevel = 99
o.lazyredraw = true
o.termguicolors = true
o.background = "dark"
o.textwidth = 80
o.clipboard = 'unnamedplus'

_G.global = {}

-- Diagnostics
local border_opts = { border = 'rounded', focusable = true, scope = 'line' }

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    float = border_opts,
    update_in_insert = false,
    severity_sort = false,
})

-- Minor customizations
-- Make 0 go to first character in line
vim.api.nvim_set_keymap('', '0', '^', { silent = true })

require('modules.core')
require('modules.lsp')
require('modules.plugins')
