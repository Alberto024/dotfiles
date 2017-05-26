set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/restore_view.vim'
call vundle#end()
filetype plugin indent on

set viewoptions=cursor,folds,slash,unix

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"
let g:UltiSnipsSnippetsDir="/home/nava/.vim/mysnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnips"]

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
    \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ 're!\\hyperref\[[^]]*',
    \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\(include(only)?|input){[^}]*',
    \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
    \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
    \ ]

let g:vimtex_fold_enabled=1
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"imap <F9> <Plug>Tex_Completion

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

syntax enable

colorscheme base16-monokai
"colorscheme radicalgoodspeed
"colorscheme molokai
"colorscheme elflord
"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif

set pastetoggle=<F8>
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cursorline
"hi clear CursorLine
"hi CursorLine gui=underline cterm=underline

command CEWS %s/\s\+$//e

au BufRead,BufNewFile *.tex setlocal textwidth=74 wrap iskeyword+=:,-
augroup vimrc_autocmds
    autocmd BufEnter *.tex highlight OverLength ctermbg=darkgrey guibg=#592929
    autocmd BufEnter *.tex match OverLength /\%74v.*/
augroup END

