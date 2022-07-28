local o = vim.opt

vim.g.clipboard = { -- on WSL, need to use a system binary for system clibboard access
	name = "win32yank-wsl",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
	cache_enabled = 0,
}

o.backup = false -- creates a backup file
o.swapfile = false -- creates a swapfile
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.undofile = true -- enable persistent undo
o.incsearch = true -- searches are incremental, useful for complex regex based searches
o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.cmdheight = 1 -- more space in the neovim command line for displaying messages
o.completeopt = { "menuone", "noselect", "menu" } -- mostly just for cmp
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file
o.hlsearch = false -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.mouse = "a" -- allow the mouse to be used in neovim
o.pumheight = 10 -- pop up menu height
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 0 -- always show tabs
o.smartcase = true -- smart case
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.termguicolors = true -- set term gui colors (most terminals support this)
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.updatetime = 300 -- faster completion (4000ms default)
o.expandtab = true -- convert tabs to spaces
o.smartindent = true -- make indenting smarter again
o.shiftwidth = 4 -- the number of spaces inserted for each indentation
o.tabstop = 4
o.softtabstop = 4
o.cursorline = true -- highlight the current line
o.relativenumber = true
o.number = true
o.laststatus = 3
o.showcmd = false
o.ruler = false
o.numberwidth = 4 -- set number column width to 2 {default 4}
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.wrap = false -- display lines as one long line
o.scrolloff = 8 -- allow for line padding when reaching the end of files
o.sidescrolloff = 8
o.hidden = true -- allow for buffers to be open in the background
o.lazyredraw = true
o.background = "dark"
o.foldmethod = "expr" -- use language server based folding
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99
o.guifont = "monospace:h17" -- the font used in graphical neovim applications
o.fillchars.eob = " "
o.shortmess:append("c")
o.whichwrap:append("<,>,[,],h,l")
o.iskeyword:append("-")
