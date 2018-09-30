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
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'mklabs/split-term.vim'
    "Plug 'neomake/neomake'
    Plug 'artur-shaik/vim-javacomplete2'
    function! BuildComposer(info)
      if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
          !cargo build --release
        else
          !cargo build --release --no-default-features --features json-rpc
        endif
      endif
    endfunction
    Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
    Plug 'zchee/deoplete-clang'
    Plug 'rhysd/vim-clang-format'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'sbdchd/neoformat'
    Plug 'christoomey/vim-tmux-navigator'
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
autocmd TermOpen * setlocal nonumber norelativenumber
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"-------------- Mappings - Insert Mode -------------
imap jj <Esc>
imap <C-F>     <Plug>(neosnippet_expand_or_jump)
smap <C-F>     <Plug>(neosnippet_expand_or_jump)
xmap <C-F>     <Plug>(neosnippet_expand_target)

"------------ Settings - Terminal Mode -------------
tnoremap <C-j> <C-\><C-n>
set splitright
set splitbelow

"------------- Custom Configurations ---------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '/Users/nld980/Development/godir/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let NERDTreeShowHidden=1

let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/6.0.1/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clang'

let g:neoformat_java_google = {
            \ 'exe': 'java',
            \ 'args': ['-jar /usr/local/share/java/google-java-format-1.6-all-deps.jar -'],
            \ 'stdin': 1, 
            \ }

let g:neoformat_enabled_java = ['google']

autocmd FileType java setlocal omnifunc=javacomplete#Complete
"call neomake#configure#automake('w')
"let g:python_host_prog  = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'
"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"

augroup _go
  autocmd!		
  autocmd BufWritePre *.java Neoformat
  autocmd BufWritePre *.yml Neoformat
  autocmd BufWritePre *.json Neoformat
  autocmd BufWritePre *.py Neoformat
augroup END
