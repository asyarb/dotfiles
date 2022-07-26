vim.cmd('packadd packer.nvim')
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local fn = vim.fn

-- install packer if needed
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
end

require('packer').init({
    -- /home/stef/.local/share/nvim/site/pack/packer/start/packer.nvim/packer_compiled.lua
    compile_path = install_path .. '/packer_compiled.lua',
})

return require('packer').startup(function(use)
    -- Plugin Manager
    use('wbthomason/packer.nvim')

    -- Libs lua
    use({
        'nvim-lua/plenary.nvim',
    })

    -- Lsp
    use({
        'neovim/nvim-lspconfig',
        'glepnir/lspsaga.nvim',
        'folke/trouble.nvim'
    })

    -- Completion
    use({
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
    })

    -- Snippets
    use({
        'L3MON4D3/luasnip',
        requires = {
            'saadparwaiz1/cmp_luasnip',
        },
    })

    -- Format/Lint
    use({ 'mhartington/formatter.nvim' })

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
    })

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    })

    -- Editor goodies
    use({
        'tpope/vim-sensible',
        'tpope/vim-vinegar',
        'tpope/vim-commentary',
        'tpope/vim-repeat',
        'tpope/vim-surround',
        'tpope/vim-abolish',
        'windwp/nvim-autopairs',
        'maxbrunsfeld/vim-yankstack',
        'junegunn/vim-easy-align',
        'christoomey/vim-tmux-navigator',
        'alvan/vim-closetag',
        'lukas-reineke/indent-blankline.nvim',
    })

    -- Git
    use({
        'tpope/vim-fugitive',
        'tpope/vim-rhubarb',
        'lewis6991/gitsigns.nvim'
    })

    -- UI
    use({
        'folke/tokyonight.nvim',
        'kyazdani42/nvim-web-devicons',
        'norcalli/nvim-colorizer.lua',
        'luochen1990/rainbow'
    })

    -- Statusline
    use({
        'itchyny/lightline.vim'
    }) 

    if packer_bootstrap then
        require('packer').sync()
    end
end)
