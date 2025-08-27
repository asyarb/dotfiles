return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>xq',
      '<cmd>:Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
