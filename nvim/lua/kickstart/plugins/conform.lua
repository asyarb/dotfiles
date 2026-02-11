-- Formatting
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        return {
          timeout_ms = 500,
          lsp_format = 'never', -- 'never' | 'fallback',
        }
      end,
      formatters = {
        prettierd = {
          require_cwd = true,
        },
        prettierd_svg = {
          command = 'prettierd',
          require_cwd = true,
          args = function(self, ctx)
            return { ctx.filename, '--parser=html' } -- Note: filename and parser format
          end,
        },
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        markdown = { 'oxfmt', 'prettierd', stop_after_first = true },
        javascript = { 'oxfmt', 'prettierd', stop_after_first = true },
        typescript = { 'oxfmt', 'prettierd', stop_after_first = true },
        typescriptreact = { 'oxfmt', 'prettierd', stop_after_first = true },
        json = { 'oxfmt', 'prettierd', stop_after_first = true },
        jsonc = { 'oxfmt', 'prettierd', stop_after_first = true },
        html = { 'oxfmt', 'prettierd', stop_after_first = true },
        svg = { 'prettierd_svg' },
        astro = { 'prettierd' },
        css = { 'oxfmt', 'prettierd', stop_after_first = true },
        php = { 'pint' },
        go = { 'gofmt' },
      },
    },
  },
}
