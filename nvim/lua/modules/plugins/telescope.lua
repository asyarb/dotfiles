local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local function nkeymap(key, map)
    keymap('n', key, map, opts)
end

nkeymap('<leader>ff', '<cmd>Telescope find_files<CR>')
nkeymap('<leader>fg', '<cmd>Telescope live_grep<CR>')
nkeymap('<leader>fb', '<cmd>Telescope buffers<CR>')
nkeymap('<leader>fh', '<cmd>Telescope help_tags<CR>')
