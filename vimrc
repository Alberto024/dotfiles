"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"vim +PluginInstall +qall
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
call vundle#end()
filetype plugin indent on

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

syntax enable
colorscheme radicalgoodspeed
"colorscheme molokai
"colorscheme elflord
set pastetoggle=<F1>
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
