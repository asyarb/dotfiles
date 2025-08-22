-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run:
--    :Lazy update
--

-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

require('lazy').setup({
  'christoomey/vim-tmux-navigator', -- Seamlessly move between tmux sessions and nvim.
  'b0o/schemastore.nvim', -- Commonly used JSON schemas like VSCode has.

  require('highlighters.plugins.blade'),
  require('highlighters.plugins.caddy'),
  require('highlighters.plugins.slim'),

  require('kickstart.plugins.gitsigns'),
  require('kickstart.plugins.which-key'),
  require('kickstart.plugins.telescope'),
  require('kickstart.plugins.lspconfig'),
  require('kickstart.plugins.conform'),
  require('kickstart.plugins.mini'),
  require('kickstart.plugins.tokyonight'),
  require('kickstart.plugins.todo-comments'),
  require('kickstart.plugins.treesitter'),
  -- require('kickstart.plugins.lint'),
  require('kickstart.plugins.autopairs'),

  require('custom.plugins.snacks'),
  require('custom.plugins.blink-cmp'),
  require('custom.plugins.autotag'),
  require('custom.plugins.rainbow'),
  require('custom.plugins.lualine'),
  require('custom.plugins.folding'),
  require('custom.plugins.tailwind-fold'),
  require('custom.plugins.oil'),
  require('custom.plugins.comments'),
  require('custom.plugins.lsp-signature'),
  require('custom.plugins.trouble'),
  require('custom.plugins.multicursor'),
  require('custom.plugins.spectre'),
}, {
  lockfile = './lazy-lock.json',
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
