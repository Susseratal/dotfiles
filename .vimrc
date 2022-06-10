""""""""""""""""""""""""""""""""
" __   _(_)_ __ ___  _ __ ___  " 
" \ \ / / | '_ ` _ \| '__/ __| "
"  \ V /| | | | | | | | | (__  "
"   \_/ |_|_| |_| |_|_|  \___| "
"                              "
""""""""""""""""""""""""""""""""                           

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

packadd! dracula
packadd! lucid
packadd! orbital
packadd! sunbather
syntax enable
colorscheme dracula

:set expandtab
:set number
:set spelllang=en
:set guioptions=0
:set backspace=indent,start
:set guifont=FreeMono\ 11
:set nowrap
:set foldmethod=manual

:nmap <C-B> :set guioptions=0<CR>
:nmap <C-j> :set go+=m<CR>
:nmap <C-s> :set spell<CR>
:nmap <C-a> :set invspell<CR>
:nmap ; :
