""""""""""""""""""""""""""""""""
" __   _(_)_ __ ___  _ __ ___  " 
" \ \ / / | '_ ` _ \| '__/ __| "
"  \ V /| | | | | | | | | (__  "
"   \_/ |_|_| |_| |_|_|  \___| "
"                              "
""""""""""""""""""""""""""""""""                           

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

colorscheme torte
:set expandtab
:set number
:set spelllang=en
:nmap <C-s> :set spell<CR>
:nmap <C-a> :set invspell<CR>
:nmap ; :
let @f='o        - [ ] '
let @g='o        - [x] '
