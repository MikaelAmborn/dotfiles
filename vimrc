set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-endwise'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'

syntax enable
filetype plugin indent on

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

" edit file in current dir
nnoremap <leader>ew :e %:p:h

nnoremap <C-å> <C-]>
" Auto save files on losing focus
au FocusLost * :wa
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
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
":autocmd FileType qf wincmd J
" define Ag command to search for provided text and open a "quickfix" window
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|botright cwindow|redraw!

nnoremap <leader>a :Ag 
"map leader c to close quickfix window
nnoremap <leader>cc :ccl<CR>

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
