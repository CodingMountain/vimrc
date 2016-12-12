set nocompatible
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
 
function TabToggle()
  if &expandtab
        set noexpandtab
    else
        set expandtab
  endif
endfunction
 
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
 
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin()
 
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomtom/tlib_vim'
""Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/syntastic'
""Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete.vim'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'craigemery/vim-autotag'
Plugin 'OrangeT/vim-csharp'
Plugin 'jaxbot/semantic-highlight.vim'
"Language specific plugins
""JS omnicompletion
"""Plugin 'ternjs/tern_for_vim'
""CSS/LESS/SASS/HTML colours
Plugin 'gko/vim-coloresque'
""Typescript
Plugin 'leafgarland/typescript-vim'
""Pug highlighting
Plugin 'digitaltoad/vim-pug'
 
call vundle#end()
filetype plugin indent on
syntax enable
 
autocmd GUIEnter * simalt ~x | call NumberToggle()
 
if &diff
  autocmd FilterWritePre * setlocal wrap<
endif
 
autocmd InsertEnter * :set number relativenumber!
autocmd InsertLeave * :set number! relativenumber
autocmd StdinReadPre * let s:std_in=1
 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | cd c:\\ | endif
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufWinEnter * set iskeyword-=.
 
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
 
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif
 
set autoread
set ruler
 
set wildmenu
 
set path+=**
 
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
 
set guifont=Consolas:h10
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=e  "remove tabs
 
set iskeyword-=.
 
set pastetoggle=<F2>
 
""let g:neocomplete#enable_at_startup = 1
 
let $PYTHONPATH = "C:\\Python27\\Lib;C:\\Python27\\DLLs;C:\\Python27\\Lib\\lib-tk"
 
let g:syntastic_javascript_checkers = ['jshint']
 
let mapleader=" "
 
""let g:ctrlp_max_files = 0
""let g:ctrlp_max_depth = 40
""let g:ctrlp_custom_ignore = {
""  \ 'dir':  '(build|\.git)',
""  \ 'file': '(\.git|\.swp)'
""  \ }
""let g:ctrlp_clear_cache_on_exit = 0
""let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["C:\\Users\\KRF\\.vim\\bundle\\vim-snippets\\UltiSnips","C:\\Users\\KRF\\vimfiles\\UltiSnips"]
 
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
 
""let g:tern_map_keys=0
""let g:tern_show_argument_hints='on_hold'
""let g:tern_map_prefix = '<leader>'
 
colorscheme happy_hacking
 
""map <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :call NumberToggle()<cr>
nmap <F9> mz:execute TabToggle()<CR>'z
 
map <Leader>s :SyntasticToggleMode<CR>
 
imap jj <esc>
imap jk <esc>
imap <c-space> <esc>
imap <s-space> <esc>
 
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
 
nnoremap <leader>d dd
nnoremap <leader>y yy
nnoremap <leader>c cc
 
nnoremap va, F,vf,
 
nnoremap vi, /\([(,]\)\@<=.\{-}\([,)]\)\@=<cr>Ngn
 
nmap c, vi,c<esc>:noh<cr>a
nmap y, vi,y:noh<cr>
nmap d, vi,d:noh<cr>hx
nmap v, vi,
nmap C, va,c
nmap Y, va,y
nmap D, va,d
nmap V, va,
 
nnoremap c9 ci(
nnoremap c[ ci[
nnoremap c{ ci{
nnoremap c' ci'
nnoremap c" ci"
nnoremap cw ciw
nnoremap c< ci<
nnoremap cT cit
nnoremap y9 yi(
nnoremap y[ yi[
nnoremap y{ yi{
nnoremap y' yi'
nnoremap y" yi"
nnoremap yw yiw
nnoremap y< yi<
nnoremap yT yit
nnoremap d9 di(
nnoremap d[ di[
nnoremap d{ di{
nnoremap d' di'
nnoremap d" di"
nnoremap dw diw
nnoremap d< di<
nnoremap dT dit
nnoremap v9 vi(
nnoremap v[ vi[
nnoremap v{ vi{
nnoremap v' vi'
nnoremap v" vi"
nnoremap vw viw
nnoremap v< vi<
nnoremap vT vit
 
nnoremap C9 ca(
nnoremap C[ ca[
nnoremap C{ ca{
nnoremap C' ca'
nnoremap C" ca"
nnoremap C< ca<
nnoremap CT cat
nnoremap Y9 ya(
nnoremap Y[ ya[
nnoremap Y{ ya{
nnoremap Y' ya'
nnoremap Y" ya"
nnoremap Y< ya<
nnoremap YT yat
nnoremap D9 da(
nnoremap D[ da[
nnoremap D{ da{
nnoremap D' da'
nnoremap D" da"
nnoremap D< da<
nnoremap DT dat
nnoremap V9 va(
nnoremap V[ va[
nnoremap V{ va{
nnoremap V' va'
nnoremap V" va"
nnoremap V< va<
nnoremap VT vat
 
nnoremap c<space> ct<space>
nnoremap C<space> cf<space>
nnoremap y<space> yt<space>
nnoremap Y<space> yf<space>
nnoremap d<space> dt<space>
nnoremap D<space> df<space>
nnoremap v<space> vt<space>
nnoremap V<space> vf<space>
 
nnoremap c. ct.
nnoremap C. cf.
nnoremap y. yt.
nnoremap Y. yf.
nnoremap d. dt.
nnoremap D. df.
nnoremap v. vt.
nnoremap V. vf.
 
nnoremap c; ct;
nnoremap C; cf;
nnoremap y; yt;
nnoremap Y; yf;
nnoremap d; dt;
nnoremap D; df;
nnoremap v; vt;
nnoremap V; vf;
 
nnoremap c> ct>
nnoremap C> cf>
nnoremap y> yt>
nnoremap Y> yf>
nnoremap d> dt>
nnoremap D> df>
nnoremap v> vt>
nnoremap V> vf>
 
nnoremap <c-c>' ct'
nnoremap <c-C>' cf'
nnoremap <c-y>' yt'
nnoremap <c-Y>' yf'
nnoremap <c-d>' dt'
nnoremap <c-D>' df'
nnoremap <c-v>' vt'
nnoremap <c-V>' vf'
 
nnoremap <c-c>" ct"
nnoremap <c-C>" cf"
nnoremap <c-y>" yt"
nnoremap <c-Y>" yf"
nnoremap <c-d>" dt"
nnoremap <c-D>" df"
nnoremap <c-v>" vt"
nnoremap <c-V>" vf"
 
vnoremap 9 c()<esc>P
vnoremap [ c[]<esc>P
vnoremap { c{}<esc>P
vnoremap ' c''<esc>P
vnoremap "" c""<esc>P
 
nnoremap <C-i> i_<esc>r
 
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
nnoremap <c-w>= :vertical resize +20<cr>
nnoremap <c-w>- :vertical resize -20<cr>
nnoremap <a-w>= :res +20<cr>
nnoremap <a-w>- :res -20<cr>
nnoremap <c-w>+ :vertical resize +5<cr>
nnoremap <c-w>_ :vertical resize -5<cr>
nnoremap <a-w>+ :res +5<cr>
nnoremap <a-w>_ :res -5<cr>
 
nnoremap <leader>, :bp<cr>
nnoremap <leader>. :bn<cr>
 
inoremap <C-h> <esc>i
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>a
 
inoremap <A-o> <esc>o
inoremap <A-O> <esc>O
 
nnoremap <expr> N  'nN'[v:searchforward]
 
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
 
nnoremap [<space>  :put! =''<cr>
nnoremap ]<space>  :put =''<cr>
 
xnoremap <  <gv
xnoremap >  >gv
 
noremap <M-p> "*p
noremap <C-y> "*y
 
noremap <Leader>bd <C-w>s:bn<cr><C-w>k:bd<cr>
 
nnoremap <Leader>h :Hate<cr>
 
noremap <C-s> <C-w>s
noremap <M-s> <C-w>v
 
nnoremap K i<CR><Esc>
 
""map <C-w> <C-p><C-\>w
 
" fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gaa :bufdo Git add %:p<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :! git push<CR>
nnoremap <Leader>gpl :! git pull<CR>
 
nnoremap <Leader>pb :!gulp build<CR>
nnoremap <Leader>p :!gulp<CR>
 
nnoremap <Leader>vg :noautocmd vimgrep<space>
nnoremap <Leader>vgj :noautocmd vimgrep  **/*.js<left><left><left><left><left><left><left><left>
nnoremap <Leader>vgh :noautocmd vimgrep  **/*.html **/*.pug<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
 
nnoremap <Leader>se :Errors<CR>
 
" tern bindings
""nnoremap <Leader>td :TernDef<cr>
""nnoremap <Leader>to :TernDoc<cr>
""nnoremap <Leader>tt :TernType<cr>
""nnoremap <Leader>tf :TernRefs<cr>
""nnoremap <Leader>tr :TernRename<cr>
 
nnoremap <Leader>ws :call CleanDoc()<cr>
 
nnoremap Q qa
nnoremap <c-@> @a
 
"" <c-]> ctags jump to definition
"" <c-t> ctags jump back from definition
"" g] ctags see all definitions
 
nnoremap <Leader>e :Explore<cr>
nnoremap <Leader>- :Explore<cr>
 
nnoremap <Leader>w yiw:find <c-r>"<cr>
nnoremap <Leader>f :find 
 
nnoremap <Leader>ue :UltiSnipsEdit<cr>
 
nnoremap <Leader>cdfe :cd Development\Git\Fnbs.Frontend\src\<cr>:Explore<cr>
nnoremap <Leader>cdwa :cd Development\Git\Fnbs.WebApi\<cr>:Explore<cr>
 
nnoremap <Leader>sh :SemanticHighlightToggle<cr>
