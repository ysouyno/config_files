" General settings
set encoding=utf-8
set number
set relativenumber
set cursorline
set background=light " for nvim
syntax on

" Space instead of TAB
set expandtab
set tabstop=2
set shiftwidth=2

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

" YouCompleteMe settings
Plug 'Valloric/YouCompleteMe'

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_use_clangd = 0
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" ultisnips settings
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" let g:UltiSnipsExpandTrigger = "<TAB>"
" let g:UltiSnipsJumpForwardTrigger = "<TAB>"
" let g:UltiSnipsJumpBackwardTrigger = "<S-TAB>"

" vimfiler settings
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimfiler'

" let g:vimfiler_as_default_explorer = 1
" autocmd vimenter * VimFilerExplorer

" nerdtree settings
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
