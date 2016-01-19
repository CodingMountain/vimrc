set nocompatible
filetype off
syntax enable

function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set relativenumber!
  else
    set relativenumber
    set number!
  endif
endfunc

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-surround'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tomtom/tcomment_vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'OrangeT/vim-csharp'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

autocmd GUIEnter * simalt ~x | call NumberToggle()

if &diff
    autocmd FilterWritePre * setlocal wrap<
endif

autocmd InsertEnter * :set number relativenumber!
autocmd InsertLeave * :set number! relativenumber
autocmd BufEnter set modifiable

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | cd c:\\ | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

autocmd FileType Python :UltiSnipsAddFiletypes Python
autocmd FileType cs :UltiSnipsAddFiletypes cs

autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
autocmd FileType cs nnoremap <C-9> :OmniSharpNavigateUp<cr>
autocmd FileType cs nnoremap <C-0> :OmniSharpNavigateDown<cr>
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
autocmd FileType cs map <buffer> <C-r> :Rename<Space>

set autoread
set ruler

set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw

set omnifunc=syntaxcomplete#Complete
set updatetime=1000
set diffexpr=

set hidden
set noshowmatch
set completeopt=longest,menuone,preview
set splitbelow

set previewheight=5
set tabstop=4
set shiftwidth=4
set expandtab

set list lcs=trail:.

set laststatus=2

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set guifont=Consolas
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

let mapleader=" "

let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:syntastic_cs_checkers = ['code_checker']

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:OmniSharp_typeLookupInPreview = 1
let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'

colorscheme jellybeans

map <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :call NumberToggle()<cr>

imap jj <esc>

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

let g:multi_cursor_next_key='<C-t>'

nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>tp :OmniSharpAddToProject<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <expr> N  'nN'[v:searchforward]

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :put! =''<cr>
nnoremap ]<space>  :put =''<cr>

xnoremap <  <gv
xnoremap >  >gv
