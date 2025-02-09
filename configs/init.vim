" ==============================
" Vim config reuse
" https://neovim.io/doc/user/nvim.html#nvim-from-vim 
" ==============================
set runtimepath^=~/.vim runtimepath+=~/.vim/after " Add ~/.vim and ~/.vim/after to the runtime path
let &packpath = &runtimepath " Set the package path to match the runtime path  
source ~/.vimrc " Load general Vim config from ~/.vimrc

