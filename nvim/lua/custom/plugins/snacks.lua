return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    bigfile = {
      enabled = true,
      size = 3 * 1024 * 1024, -- 3MB
    },
    dashboard = { enabled = true },
    input = { enabled = true },
  },
}
