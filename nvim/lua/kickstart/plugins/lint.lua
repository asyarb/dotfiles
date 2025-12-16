local function eslint_config_exists()
  local eslint_files = {
    'eslint.config.js',
    'eslint.config.mjs',
    '.eslintrc',
    '.eslintrc.json',
    '.eslintrc.js',
  }
  local current_dir = vim.fn.getcwd()

  for _, file in ipairs(eslint_files) do
    if vim.fn.filereadable(vim.fn.glob(current_dir .. '/' .. file)) == 1 then
      return true
    end
  end

  return false
end

local function get_linter()
  if eslint_config_exists() then
    return 'eslint_d'
  end
  return nil
end

-- Linting
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    -- Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        local linter = get_linter()

        if linter then
          lint.linters_by_ft = {
            typescript = { linter },
            typescriptreact = { linter },
          }

          require('lint').try_lint()
        end
      end,
    })
  end,
}
