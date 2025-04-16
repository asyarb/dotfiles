vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true, desc = 'CodeCompanion: Actions' })
vim.keymap.set({ 'n', 'v' }, '<leader>ct', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true, desc = 'CodeCompanion: Chat' })
vim.keymap.set('v', '<leader>cg', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true, desc = 'CodeCompain: Add to Chat' })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'markdown', 'codecompanion' },
    },
  },
  event = 'VeryLazy',
  opts = {
    strategies = {
      chat = {
        adapter = 'openrouter',
      },
      inline = {
        adapter = 'openrouter',
      },
    },

    adapters = {
      openrouter = function()
        return require('codecompanion.adapters').extend('openai_compatible', {
          env = {
            url = 'https://openrouter.ai/api',
            api_key = 'cmd:cat ~/code/creds/openrouter',
            chat_url = '/v1/chat/completions',
          },
          schema = {
            model = {
              default = 'google/gemini-2.0-flash-001',
            },
          },
        })
      end,
    },

    display = {
      inline = {
        layout = 'vertical', -- vertical|horizontal|buffer
      },

      diff = {
        provider = 'mini_diff', -- default|mini_diff
      },
    },

    -- opts = {
    --   -- Set debug logging
    --   log_level = 'DEBUG',
    -- },
  },
}
