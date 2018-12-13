" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set relativenumber!
    else
        set relativenumber
        set number!
    endif
endfunc

function! StripTrailingWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfunction

function CleanDoc()
  if &modifiable
    retab
    call StripTrailingWhitespace()
  endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nanotech/jellybeans.vim'
call plug#end()

colorscheme jellybeans

let g:UltiSnipsExpandTrigger="<c-c>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

let g:rbpt_max = 16
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

set list lcs=trail:.

" TODO: Pick a leader key
let mapleader = " "

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set formatoptions=tqn1
set noshiftround
set tabstop=4
set shiftwidth=4
set expandtab

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ 
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark

autocmd VimEnter * call NumberToggle()

set pastetoggle=<F2>

nnoremap <C-m> :call NumberToggle()<cr>

nnoremap <leader>, :bp<cr>
nnoremap <leader>. :bn<cr>

inoremap <C-h> <esc>i
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>a

nnoremap <expr> N  'nN'[v:searchforward]

nnoremap [<space>  :put! =''<cr>
nnoremap ]<space>  :put =''<cr>

xnoremap <  <gv
xnoremap >  >gv

noremap <Leader>bd <C-w>s:bn<cr><C-w>j:bd<cr>

nnoremap <Leader>ws :call CleanDoc()<cr>

nnoremap <Leader>- :Explore<cr>

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

noremap n nzz
nnoremap N Nzz

nnoremap <C-t> :FZF<return>

inoremap jj <esc>

nnoremap <leader>m :cn<return>
nnoremap <leader>n :cp<return>
nnoremap <leader>c :cc<return>
nnoremap <leader>r :Rg 

nnoremap <leader>ue :UltiSnipsEdit<cr>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
