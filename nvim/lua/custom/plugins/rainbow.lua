-- rainbow brackets
-- https://github.com/HiPhish/rainbow-delimiters.nvim

return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'BufEnter',
  config = function()
    vim.g.rainbow_delimiters = {
      query = {
        javascript = 'rainbow-parens',
        tsx = 'rainbow-parens',
      },
    }
  end,
}
