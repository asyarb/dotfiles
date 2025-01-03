-- rainbow brackets
-- https://github.com/HiPhish/rainbow-delimiters.nvim

vim.g.rainbow_delimiters = {
  query = {
    javascript = 'rainbow-parens',
    tsx = 'rainbow-parens',
  },
}

return {
  'HiPhish/rainbow-delimiters.nvim',
}
