local u = require('utils')
local lsp = vim.lsp

local lsp_formatting = function(bufnr)
    local clients = vim.lsp.get_active_clients({ bufnr = bufnr })

    lsp.buf.format({
        bufnr = bufnr,
        filter = function(client)
            if client.name == 'eslint' then
                return true
            end

            if client.name == 'null-ls' then
                return not u.table.some(clients, function(_, other_client)
                    return other_client.name == 'eslint'
                end)
            end
        end,
    })
end
