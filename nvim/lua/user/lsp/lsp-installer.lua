-- Add LSP server to this list after installing
local servers = {
	"sumneko_lua",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"prismals",
	"tailwindcss",
	"vimls",
    "rust_analyzer",
    "taplo"
}

require("nvim-lsp-installer").setup()

local lspconfig = require("lspconfig")

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "tsserver" then
		local tsserver_opts = require("user.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)

        require("typescript").setup({ server = opts })

        goto continue
	end

    if server == "rust_analyzer" then
        local rust_opts = {
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            settings = require("user.lsp.settings.rust_analyzer")
        }

        require('rust-tools').setup({ server = rust_opts })

        goto continue
    end

	if server == "jsonls" then
		local jsonls_opts = require("user.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	lspconfig[server].setup(opts)

    ::continue::
end
