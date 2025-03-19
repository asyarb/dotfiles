vim.keymap.set('n', '<leader>F', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = 'Toggle Spectre',
})

return {
  'nvim-pack/nvim-spectre',
  event = 'VeryLazy',
}
