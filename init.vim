call plug#begin('~/.config/nvim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
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
    Plug 'vim-airline/vim-airline'
    Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
    Plug 'fatih/vim-go'
    Plug 'mklabs/split-term.vim'
    "Plug 'neomake/neomake'
    Plug 'artur-shaik/vim-javacomplete2'
call plug#end()

"----------------- Spaces & Tabs -------------------
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
"set autoindent
set copyindent      " copy indent from the previous line
set relativenumber
set number

"--------- Leader Mappings - Normal Mode -----------
nnoremap <SPACE> <Nop>  
let mapleader="\<SPACE>"

nnoremap ' :
nnoremap <Leader><Leader> :NERDTreeToggle<CR>
nnoremap <Leader>tt :VTerm<CR>
nnoremap <Leader>ht :Term<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"-------------- Mappings - Insert Mode -------------
imap jj <Esc>


"------------ Settings - Terminal Mode -------------
tnoremap <C-j> <C-\><C-n>
set splitright
set splitbelow

"------------- Custom Configurations ---------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '/Users/nld980/Development/godir/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let NERDTreeShowHidden=1

autocmd FileType java setlocal omnifunc=javacomplete#Complete
"call neomake#configure#automake('w')
"let g:python_host_prog  = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'
