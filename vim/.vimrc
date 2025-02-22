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
" Plugins
" ==============================
if exists('*plug#begin')
    call plug#begin()

    Plug 'tpope/vim-commentary'                     " Commenting (gcc, gc)
    Plug 'tpope/vim-surround'                       " Surroundings (ysiw', cs', etc.)
    Plug 'machakann/vim-highlightedyank'            " Highlight yanked text
    Plug 'easymotion/vim-easymotion'                " Fast navigation
    
    call plug#end()
else
    autocmd VimEnter * echon "vim-plug not detected. Skipping plugin setup." | redraw
endif
