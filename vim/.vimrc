" General settings
set encoding=utf-8
set number
syntax on

" Space instead of TAB
set expandtab
set tabstop=2
set shiftwidth=2

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug '~/gits/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_use_clangd = 0

" ultisnips settings
let g:UltiSnipsExpandTrigger = "<c-j>"
