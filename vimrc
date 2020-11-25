set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" My Bundles
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-endwise'
Plug 'nanotech/jellybeans.vim'
Plug 'Lokaltog/vim-powerline'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'slim-template/vim-slim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/dbext.vim'
Plug 'mhinz/vim-signify'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'StanAngeloff/php.vim'
Plug 'brooth/far.vim'
Plug 'chrisbra/Colorizer'
" Javascript
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'posva/vim-vue'

Plug 'tfnico/vim-gradle'

if !has('nvim')
  Plug 'Shougo/vimproc.vim', {'build' : {'mac' : 'make -f make_mac.mak' } }
  Plug 'skywind3000/asyncrun.vim'
  Plug 'Shougo/neocomplete.vim'
  Plug 'tpope/vim-sensible'
endif
" Neovim only plugins
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'neovim/node-host'
  Plug 'roxma/nvim-completion-manager'
  Plug 'snoe/nvim-parinfer.js'
  "Plug 'snoe/clj-refactor.nvim'
endif

" Initialize plugin system
call plug#end()

" git signify
let g:signify_vcs_list = [ 'git' ]
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

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

" fzf to open files with ctrl-p
nnoremap <C-p> :Files<Cr>


" Show extra whitespace
set list listchars=tab:\|_,trail:·,extends:>,precedes:<

set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=400
set ttyfast
set lazyredraw
if !has('nvim')
  set ttyscroll=3
endif
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
set termguicolors

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
" treat .es6 as .js
au BufNewFile,BufRead *.es6 set filetype=javascript
" Allow jsx in files ending with .js
let g:jsx_ext_required = 0

set background=dark
" colorscheme my-rails-casts
"colorscheme codeschool
colorscheme gruvbox
" switch to light colorscheme
nnoremap <leader>li :set background=light<cr>:colorscheme solarized<cr>
" switch back to dark
nnoremap <leader>da :set background=dark<cr>:colorscheme my-rails-casts<cr>

" allow switching from changed buffers
set hidden

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
" Syntastic vvv
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint --'
" Syntastic ^^^

" clear previous search with ,<space>
nnoremap <leader><space> :noh<cr>
" make tab match bracket pairs, useful for moving
"nnoremap <tab> %
"vnoremap <tab> %
" make j and k work on file lines
nnoremap j gj
nnoremap k gk

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

map € $

" Search for tag under cursor
nnoremap <leader>t <C-]>
" rebuild ctags
nnoremap <leader>ct :!/usr/local/bin/ctags -R .<cr>

" tab completion settings
set wildmode=longest,list:longest

set splitright
set splitbelow

" Run file with rspec using tpope's Dispatch plugin
nnoremap <leader>r :Dispatch rspec --color %<cr>

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Syntastic
"let g:syntastic_mode_map = { 'mode': 'passive' }
"let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'

" Deoplete
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#keyword_patterns = {}
  let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
endif

" Set specific linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1 
let g:airline#extensions#ale#enabled = 1 

" Test helpers from Gary Bernhardt's screen cast:
" https://www.destroyallsoftware.com/screencasts/catalog/file-navigation-in-vim
" https://www.destroyallsoftware.com/file-navigation-in-vim.html
function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
    exec ":!time rspec --color " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>m :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>. :call RunNearestTest()<cr>
" Run all test files
map <leader>A :call RunTests('spec')<cr>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-g> :Rg<Cr>
" ¸ = <Alt-g> on my mac
nnoremap ¸ :Rg <C-R><C-W><Cr>

" Highlight colors in hex and rgb in css, scss, html and php files
let g:colorizer_auto_filetype='css,scss,html,php'
