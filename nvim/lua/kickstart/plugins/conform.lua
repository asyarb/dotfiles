-- Formatting
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        return {
          timeout_ms = 500,
          lsp_format = 'never', -- 'never' | 'fallback',
        }
      end,
      formatters = {
        prettierd_svg = {
          command = 'prettierd',
          args = function(self, ctx)
            return { ctx.filename, '--parser=html' } -- Note: filename and parser format
          end,
        },
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', 'biome', stop_after_first = true },
        typescript = { 'prettierd', 'biome', stop_after_first = true },
        typescriptreact = { 'prettierd', 'biome', stop_after_first = true },
        json = { 'prettierd', 'biome', stop_after_first = true },
        jsonc = { 'prettierd', 'biome', stop_after_first = true },
        markdown = { 'prettierd' },
        html = { 'prettierd' },
        svg = { 'prettierd_svg' },
        astro = { 'prettierd' },
        css = { 'prettierd' },
        php = { 'pint' },
        go = { 'gofmt' },
      },
    },
  },
}
