-- Status line: file info, line number, etc.
-- https://github.com/nvim-lualine/lualine.nvim

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    icons_enabled = vim.g.have_nerd_font,
    theme = 'tokyonight',
    sections = {
      lualine_c = { { 'filename', path = 1 } },
    },
    inactive_sections = {
      lualine_c = { { 'filename', path = 1 } },
    },
  },
}
