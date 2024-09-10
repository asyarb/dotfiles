-- Show the signature of a function as you type.
return {
  'ray-x/lsp_signature.nvim',
  event = 'VeryLazy',
  opts = {
    hint_enable = false,
    padding = '',
    handler_opts = {
      border = 'none',
    },
  },
}
