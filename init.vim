""""""""""""""""""
" Plugins
""""""""""""""""""

call plug#begin()

" Base
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-abolish'
    Plug 'jiangmiao/auto-pairs'
    Plug 'maxbrunsfeld/vim-yankstack'
    Plug 'junegunn/vim-easy-align'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'alvan/vim-closetag'
    Plug 'lukas-reineke/indent-blankline.nvim'

" Completion and LSP
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'folke/trouble.nvim'
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

" Prettier
    " post install (yarn install | npm install) then load plugin only for editing supported files
    Plug 'prettier/vim-prettier', {
        \ 'do': 'npm install --frozen-lockfile --production',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] 
    \}

" UI
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'itchyny/lightline.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'luochen1990/rainbow'
    Plug 'kyazdani42/nvim-web-devicons'

" File finder
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'airblade/vim-gitgutter'

call plug#end()
call yankstack#setup()

""""""""""""""""""
" Settings
""""""""""""""""""

set completeopt=menu,menuone,noselect

" Leader keybind
    let mapleader = " " 

" Require gutter to be always visible
    set signcolumn=yes

" Load local init.vim files in a project directory
    set exrc

" Relative line numbers but keep current line number
    set relativenumber
    set number

" Prevent search highlights from showing when viewing results
    set nohlsearch

" Allow un-saved buffers to be open in the background
    set hidden

" Disable text wrapping at maximum buffer size
    set nowrap

" Disable swapfile and backups (because we're not in 1990 anymore)
    set noswapfile
    set nobackup
    set nowritebackup

" Undo management and persistence
    set undodir=~/.nvim/undodir
    set undofile

" Use incremental search (useful for complicated regex based searches)
    set incsearch

" Unix yank support for system clipboard
    set clipboard+=unnamedplus

" WSL yank support for system clipboard. w32yank.exe MUST be in the unix path
" $PATH. See: https://superuser.com/questions/1291425/windows-subsystem-linux-make-vim-use-the-clipboard
    let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }

" Fixes an issue where netrw yanks empty line
    let g:netrw_banner = 1

" Lightline
    let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'colorscheme': 'tokyonight',
      \ } 

" File Finding (fzf)
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Language customizations

" UI
    set termguicolors
    set lazyredraw
    set cursorline
    set background=dark

    let g:tokyonight_style = "night"
    let g:tokyonight_italic_comments = 0
    let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

    colorscheme tokyonight

" Line width
    set textwidth=80

" Indention
    filetype plugin indent on
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set smartindent
    set expandtab
    set formatoptions=lq

" indentLine
    let g:indent_blankline_char = '|'

" Folding
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set foldlevelstart=99

" EasyAlign
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

" Yankstack
    let g:yankstack_map_keys = 0
    nmap <C-P> <Plug>yankstack_substitute_older_paste

" Make 0 go to first character in line
    map 0 ^

" Allow netrw to remove non-empty local directories
    let g:netrw_localrmdir = 'trash'

" Rainbow parenthesis
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \	'guifgs': ['#E5c07B', '#C678DD', '#56B6C2'],
    \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \	'operators': '',
    \}

" CloseTag
    let g:closetag_filenames = '*.html, *.xhtml, *.phtml, *.js, *.ts, *.tsx, *.md, *.mdx'

" Colorize valid color codes in files
    lua require'colorizer'.setup()

" Icons
lua << EOF
    require'nvim-web-devicons'.setup {
        default = true;
    }
EOF

" Prettier
    let g:prettier#autoformat = 1
    let g:prettier#autoformat_require_pragma = 0

""""""""""""""""""
" LSP
""""""""""""""""""

" Treesitter
lua << EOF
    require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "typescript", "tsx", "css", "javascript", "html" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            disable = { "markdown", "vim" },

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
    } 
EOF

" LSP Installer
lua << EOF
    local lsp_installer = require("nvim-lsp-installer")
    lsp_installer.on_server_ready(function(server)
        local opts = {}

        if server.name == "sumneko_lua" then
            opts = {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim', 'use' }
                  },
                  workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
                  }
                }
              }
            }
        end

        server:setup(opts)
    end)
EOF


" Completion
lua <<EOF
    local cmp = require'cmp'
    local lsp = vim.lsp
    local luasnip = require'luasnip'

    local border_opts = { border = 'rounded', focusable = true, scope = 'line' }

    -- Completion text
    lsp.protocol.CompletionItemKind = {
        Text = ' [text]',
        Method = ' [method]',
        Function = ' [function]',
        Constructor = ' [constructor]',
        Field = 'ﰠ [field]',
        Variable = ' [variable]',
        Class = ' [class]',
        Interface = ' [interface]',
        Module = ' [module]',
        Property = ' [property]',
        Unit = ' [unit]',
        Value = ' [value]',
        Enum = ' [enum]',
        Keyword = ' [key]',
        Snippet = '﬌ [snippet]',
        Color = ' [color]',
        File = ' [file]',
        Reference = ' [reference]',
        Folder = ' [folder]',
        EnumMember = ' [enum member]',
        Constant = ' [constant]',
        Struct = ' [struct]',
        Event = '⌘ [event]',
        Operator = ' [operator]',
        TypeParameter = ' [type]',
    }

    lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, border_opts)
    lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, border_opts)

    -- Gutter icons
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Snippets
    require('luasnip.loaders.from_vscode').lazy_load()
    vim.api.nvim_command('hi LuasnipChoiceNodePassive cterm=italic')

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                require('luasnip').lsp_expand(args.body) 
            end,
        },
        formatting = {
            format = function(entry, item)
                local menu_map = {
                    buffer = '[Buf]',
                    nvim_lsp = '[LSP]',
                    nvim_lua = '[API]',
                    path = '[Path]',
                    luasnip = '[Snip]',
                    rg = '[RG]',
                }

                item.menu = menu_map[entry.source.name] or string.format('[%s]', entry.source.name)
                item.kind = vim.lsp.protocol.CompletionItemKind[item.kind]

                return item
            end
        },
        window = {
            completion = {
                border = 'rounded',
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
            },
            documentation = {
                border = 'rounded',
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
            },
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), 
            ['<C-n>'] = {
                c = function(fallback)
                    local cmp = require('cmp')
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
            },
            ['<C-p>'] = {
                c = function(fallback)
                    local cmp = require('cmp')
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
            },
            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
            end
            end,
            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
        }),
        sources = cmp.config.sources(
            {
                { name = 'nvim_lsp', priority = 10 },
                { name = 'nvim_lsp_signature_help' },
                { name = "nvim_lua" },
                { name = 'luasnip' },
            }, 
            {
                { name = 'buffer', keyword_length = 3 },
                { name = 'path' },
                { name = 'rg' },
            }
        )
    })

    -- Set configuration for specific filetype.

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
    })

    -- capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    -- Repeat for every server you want to initiate
    require('lspconfig')['tsserver'].setup {
        capabilities = capabilities
    }

    require('lspconfig')['vimls'].setup {
        capabilities = capabilities
    }

    require('lspconfig')['tailwindcss'].setup {
        capabilities = capabilities
    }

    require('lspconfig')['cssls'].setup {
        capabilities = capabilities
    }

    require('lspconfig')['sumneko_lua'].setup {
        capabilities = capabilities
    }

EOF

" Trouble
lua << EOF
    require("trouble").setup {}
EOF

" Saga
lua << EOF
    local saga = require 'lspsaga'
    saga.init_lsp_saga()
EOF

" Keybinds
lua << EOF
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    local function nkeymap(key, map)
        keymap('n', key, map, opts)
    end

    nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
    nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
    nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
    nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
    nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
    nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
    nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
    nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')

    -- show hover doc and press twice will jumpto hover window
    -- nkeymap('K', '<cmd>Lspsaga hover_doc<CR>')
    nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')

    nkeymap('<leader>af', '<cmd>Lspsaga code_action<CR>')
    nkeymap('<leader>rn', '<cmd>Lspsaga rename<CR>')
    nkeymap("<leader>K", "<cmd>Lspsaga show_line_diagnostics<CR>")
EOF

" Terminal
    " Navigate windows
    tnoremap <C-w>h <C-\><C-n><C-w>h
    tnoremap <C-w>j <C-\><C-n><C-w>j
    tnoremap <C-w>k <C-\><C-n><C-w>k
    tnoremap <C-w>l <C-\><C-n><C-w>l
