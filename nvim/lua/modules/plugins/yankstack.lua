vim.g.yankstack_map_keys = 0
vim.api.nvim_set_keymap('n', '<C-P>', '<Plug>yankstack_substitute_older_paste', { silent = true })
