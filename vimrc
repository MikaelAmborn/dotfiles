set nocompatible
filetype off

" NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
" Let Vundle manage Vundle
"Bundle 'gmarik/vundle'

" My Bundles
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'mac' : 'make -f make_mac.mak',
\    },
\ }
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'mhinz/vim-signify'
"NeoBundle 'Shougo/unite.vim' " Try it on a faster computer
" Clojure
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'cemerick/austin'

call neobundle#end()

syntax enable
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let mapleader = ","

runtime macros/matchit.vim
inoremap jj <ESC>
" Open new split window and switch to it
nnoremap <leader>w <C-w>v<C-w>l 
nnoremap <leader>h :sp<C-w>j
" Move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Show extra whitespace
set list listchars=tab:\|_,trail:·,extends:>,precedes:<

set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyfast
set lazyredraw
set ttyscroll=3
set encoding=utf-8
set tabstop=2
set nowrap
set number
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase

set guioptions+=c

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

nnoremap <C-å> <C-]>
" Auto save files on losing focus ignore unamed buffers
:au FocusLost * silent! wa
" Auto reload files
au SwapExists * let v:swapchoice = 'e'

set background=dark
colorscheme my-rails-casts
"color jellybeans

" allow switching from changed buffers
set hidden

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" clear previous search with ,<space>
nnoremap <leader><space> :noh<cr>  
" make tab match bracket pairs, useful for moving
"nnoremap <tab> %
"vnoremap <tab> %
" make j and k work on file lines
nnoremap j gj
nnoremap k gk

" Ag
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " use ag in CtrlP for listing files
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough to CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|botright cwindow|redraw!

nnoremap <leader>a :Ag 

"map leader c to close quickfix window
nnoremap <leader>cc :ccl<CR>

" open tabs with <cmd-N>
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt

map <D-t> :CtrlP<cr>
imap <D-t> <esc>:CtrlP<cr>

nnoremap € $
vnoremap € $

" Search for tag under cursor
nnoremap <leader>t <C-]>

" tab completion settings
set wildmode=longest,list:longest

set splitright
set splitbelow

nnoremap <leader>cr :CoffeeRun<cr>
vnoremap <leader>cr :CoffeeRun<cr>

" Run file with rspec using tpope's Dispatch plugin
nnoremap <leader>r :Dispatch rspec %<cr>

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Syntastic
"let g:syntastic_mode_map = { 'mode': 'passive' }
"let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'
