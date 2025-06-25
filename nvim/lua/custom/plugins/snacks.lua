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
    image = {
      enabled = true,
      doc = {
        inline = false,
        float = true,
        max_width = 20,
        max_height = 10,
      },
    },
  },
}
