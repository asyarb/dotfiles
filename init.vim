""""""""""""""""""
" Plugins
""""""""""""""""""

call plug#begin()

" Base
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'maxbrunsfeld/vim-yankstack'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-abolish'

" UI
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'chriskempson/base16-vim'

" File finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

" Git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'airblade/vim-gitgutter'

 " Scratch
    Plug 'duff/vim-scratch'

" Language Support
    Plug 'sheerun/vim-polyglot'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'neo4j-contrib/cypher-vim-syntax'

" Rainbow parentheses
    Plug 'luochen1990/rainbow'

" Autoclose Tags
    Plug 'alvan/vim-closetag'

call plug#end()

""""""""""""""""""
" Functions
""""""""""""""""""

" Show syntax highlighting groups for word under cursor
nmap <F2> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""""""""""""""""""
" Settings
""""""""""""""""""

" Clipboard
    set clipboard+=unnamedplus

    " Fixes an issue where netrw yanks empty line
    let g:netrw_banner = 1
  
" FuzzyFileFinder
    set rtp+=/usr/bin/fzf

" Language customizations

" UI
    set termguicolors
    set lazyredraw
    set cursorline
    set number

    " Themes
    set background=dark
    let base16colorspace=256
    colorscheme base16-chalk
    let g:airline_theme='base16_chalk'

    " Disable gitgutter signs
    " let g:gitgutter_signs = 0

" Indention
    filetype plugin indent on
    set tabstop=2
    set shiftwidth=2
    set expandtab
    set breakindent
    set formatoptions=l
    set lbr

" Folding
    set foldmethod=indent
    set foldlevelstart=99

" EasyAlign
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

" Yankstack
    let g:yankstack_map_keys = 0
    nmap <C-P> <Plug>yankstack_substitute_older_paste

" Language Support
    " Set Dockerfile syntax for *.dockerfile
    au BufRead,BufNewFile *.[Dd]ockerfile setf Dockerfile

    " Syntax highlight Markdown fenced blocks
    let g:vim_markdown_fenced_languages = ['js', 'bash=sh']

" Prettier
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Make 0 go to first character in line
    map 0 ^

" Allow netrw to remove non-empty local directories
    let g:netrw_localrmdir = 'trash'

" Rainbow parenthesis
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \	'guifgs': ['#DCDCAA', '#C586C0', '#569cd6'],
    \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \	'operators': '',
    \}

" Airline
    let g:airline_powerline_fonts = 1

" CloseTag
    let g:closetag_filenames = '*.html, *.xhtml, *.phtml, *.js, *.ts, *.tsx, *.md, *.mdx'

" Terminal
    " Navigate windows
    tnoremap <C-w>h <C-\><C-n><C-w>h
    tnoremap <C-w>j <C-\><C-n><C-w>j
    tnoremap <C-w>k <C-\><C-n><C-w>k
    tnoremap <C-w>l <C-\><C-n><C-w>l
