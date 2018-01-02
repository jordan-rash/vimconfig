call plug#begin('~/.config/nvim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'w0rp/ale'
    Plug 'Yggdroot/indentLine'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'zchee/deoplete-jedi'
    Plug 'zchee/deoplete-go', { 'do': 'make'}
call plug#end()

"----------------- Spaces & Tabs -------------------
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
"set autoindent
set copyindent      " copy indent from the previous line


"--------- Leader Mappings - Normal Mode -----------
nnoremap <SPACE> <Nop>  
let mapleader="\<SPACE>"

nnoremap ' :
nnoremap <Leader><Leader> :NERDTreeToggle<CR>

"-------------- Mappings - Insert Mode -------------
imap jj <Esc>


"------------- Custom Configurations ---------------
let g:deoplete#enable_at_startup = 1
"let g:python_host_prog  = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'
