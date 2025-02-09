" ==============================
" General Settings
" ==============================
set nocompatible              " Improved Vim functionality (disable Vi compatibility)
set ruler                     " Show cursor position at the bottom
set showcmd                   " Display incomplete commands
set showmode                  " Display mode (e.g., INSERT, VISUAL)
set number relativenumber     " Hybrid line numbers (absolute + relative)

" ==============================
" Search Enhancements
" ==============================
set hlsearch                  " Highlight search results
set incsearch                 " Incremental search (search as you type)
set ignorecase                " Case insensitive searching...
set smartcase                 " ...unless a capital letter is used
set showmatch                 " Show matching parentheses/brackets

" ==============================
" Indentation and Tabs
" ==============================
set expandtab                 " Convert tabs to spaces
set tabstop=4                 " Number of spaces for a tab
set softtabstop=4             " Spaces for Tab and Backspace
set shiftwidth=4              " Auto-indent width
set autoindent                " Copy indentation from current line
filetype plugin indent on     " Enable filetype detection, plugins, and indentation

" ==============================
" Quality of Life Improvements
" ==============================
set scrolloff=5               " Keep 5 lines above/below cursor when scrolling
set sidescrolloff=5           " Keep 5 columns to the left/right of cursor

" ==============================
" Visual Enhancements
" ==============================
syntax enable                 " Enable syntax highlighting
set cursorline                " Highlight current line
color habamax                 " Set color scheme

" ==============================
" IdeaVim
" ==============================
if has('ide')

    " Don't use Ex mode, use Q for formatting.
    map Q gq

    "" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
    "" Map \r to the Reformat Code action
    "map \r <Action>(ReformatCode)

    "" Map <leader>d to start debug
    "map <leader>d <Action>(Debug)

    "" Map \b to toggle the breakpoint on the current line
    "map \b <Action>(ToggleLineBreakpoint)

    " Normal mode = Vim, Insert mode = IDE
    sethandler n:vim i:ide

    " Use system clipboard
    set clipboard+=unnamedplus

    " Use ideajoin to join lines in a smart way
    set ideajoin

    " Do not use IdeaVim inside commit tool windows or other dialogs
    set ideavimsupport=

    " Automatically reload .ideavimrc when saving
    autocmd BufWritePost .ideavimrc source $HOME/.ideavimrc

endif

" ==============================
" NeoVim
" ==============================
if has('nvim')
    if has('wsl')
        set clipboard+=unnamedplus
        let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': 'clip.exe',
                \      '*': 'clip.exe',
                \    },
                \   'paste': {
                \      '+': 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \      '*': 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \   },
                \   'cache_enabled': 0,
                \ }
    endif
    set clipboard+=unnamedplus
endif

" ==============================
" Plugins (Vim/NeoVim + IdeaVim common)
" ==============================
call plug#begin()

Plug 'tpope/vim-commentary'                     " Commenting (gcc, gc)
Plug 'tpope/vim-surround'                       " Surroundings (ysiw', cs', etc.)
Plug 'machakann/vim-highlightedyank'            " Highlight yanked text
Plug 'vim-scripts/argtextobj.vim'               " Argument text object (vaa, cia, daa, etc.)
Plug 'dbakker/vim-paragraph-motion'             " Consider whitespace lines for paragraph motion
Plug 'michaeljsmith/vim-indent-object'          " Indent text object (ai, ii, aI)

call plug#end()

