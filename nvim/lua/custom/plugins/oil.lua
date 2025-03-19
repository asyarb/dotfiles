return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        return vim.tbl_contains({ '.git' }, name)
      end,
    },
    keymaps = {
      ['<C-h>'] = false,
      ['<C-l>'] = false,
    },
  },
  init = function()
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
