local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "", -- one of "all" or a list of languages
    sync_install = false,
    auto_install = true, -- Automatically install missing parsers when entering buffer
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "markdown" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
    rainbow = {
        enable = true
    },
	indent = { enable = true, disable = { "python" } },
})
