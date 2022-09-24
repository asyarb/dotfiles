local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})

	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local packer = require("packer")

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded",
	},
	auto_clean = true,
})

-- Install your plugins here
return packer.startup(function(use)
	-- Pre-requisite plugins
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- Useful lua functions for popups used by other plugins
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("MunifTanjim/nui.nvim") -- Useful UI utilities used by lots of plugins
	use("lewis6991/impatient.nvim") -- Faster Lua module loading

	-- General Usage and Motions
	use("lukas-reineke/indent-blankline.nvim") -- Smart indentions for editing
	use("tpope/vim-abolish") -- Helpful utilities for manipulating words/casing
	use("tpope/vim-surround") -- Surround
	use("tpope/vim-repeat") -- Make . not suck
	use("christoomey/vim-tmux-navigator") -- Allow seamless navigation between buffers and tmux
	use("preservim/vim-markdown") -- Helpful markdown utils

	-- Comments
	use("numToStr/Comment.nvim") -- Comment engine
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Context aware commenting, such as in JSX

	-- UI
	use("kyazdani42/nvim-web-devicons") -- Icons
	use("nvim-lualine/lualine.nvim") -- Status line at the bottom of the editor
	use({ "catppuccin/nvim", as = "catppuccin" }) -- Colorscheme
	use("folke/todo-comments.nvim") -- Todo comments and task management
	use("rcarriga/nvim-notify") -- Notification windows

	-- Completions
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP comletions
	use("hrsh7th/cmp-nvim-lua") -- nvim runtime completions in Lua

	-- cmp snippets
	use("L3MON4D3/LuaSnip") --snippet engine

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("RRethy/vim-illuminate") -- highlight symbols and words
	use("folke/trouble.nvim") -- Aggregated LSP diagnostics
	use("ray-x/lsp_signature.nvim") -- Function signature highlight as you type
	use("CosmicNvim/cosmic-ui") -- Pretty UI for common LSP actions
	use("jose-elias-alvarez/typescript.nvim") -- TypeScript
	use("simrat39/rust-tools.nvim") -- Rust

	-- File Tree
	use("nvim-neo-tree/neo-tree.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- File finder

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter") -- Semantic highlighting
	use("p00f/nvim-ts-rainbow") -- Rainbow brackets
	use("windwp/nvim-autopairs") -- Autopairs, integrates with cmp and treesitter
	use("windwp/nvim-ts-autotag") -- Autotags, integrates with cmp and treesitter

	-- Git
	use("lewis6991/gitsigns.nvim") -- Gutter signs

	-- Terminal
	use("voldikss/vim-floaterm")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
