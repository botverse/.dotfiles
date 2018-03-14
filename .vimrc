"     My .vimrc
" ___________________
" Credit to:
" - http://amix.dk/vim/vimrc.html
" - http://nvie.com/posts/how-i-boosted-my-vim/
" - http://github.com/juco/dotfiles

" splash
autocmd VimEnter * if !argc() | e ~/.dotfiles/.vimintro | endif

" esc
imap jj <Esc>

" autoload
call plug#begin('~/.local/share/nvim/plugged')

" Plugin list
Plug 'gmarik/Vundle.vim'
Plug 'wesQ3/vim-windowswap'             " window swap
Plug 'scrooloose/nerdtree'              " File browser
Plug 'jistr/vim-nerdtree-tabs'          " One NERDTree to rule the all
Plug 'vim-syntastic/syntastic'          " Syntax checking
Plug 'altercation/vim-colors-solarized' " Colours
Plug 'christoomey/vim-tmux-navigator'   " Pane navigation tmux/vim
Plug 'Shougo/vimproc.vim'               " Async tasks
Plug 'Shougo/unite.vim'                 " Unite

" Language specific
Plug 'rhysd/vim-wasm'                   " wasm
Plug 'othree/yajs.vim'                  " es6
Plug 'pangloss/vim-javascript'          " React / Javascript
Plug 'mxw/vim-jsx'                      " jsx
Plug 'groenewege/vim-less'              " LESS
Plug 'octol/vim-cpp-enhanced-highlight' " C++
Plug 'tpope/vim-bundler'                " Ruby bundler

call plug#end()

" Colorscheme
colorscheme solarized
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=dark
set cursorline
highlight LineNr ctermfg=grey ctermbg=236
syntax enable

" Extra whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/

" Tabs
set expandtab    " use spaces instead of tabs
set tabstop=2
set shiftwidth=2

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=50
autocmd StdinReadPre * let s:std_in=1

map <C-\> :NERDTreeTabsToggle<CR>
nmap gn :NERDTreeTabsFind<CR>

" Some more crucial settings
set relativenumber " relative line numbers
set number
set showmatch    " show matching parenthesis
set smartcase    " search case-insensitive if everything is lower case
set hlsearch     " highlight search terms
set incsearch    " highlight search terms as you type
set title        " set the terminal title
set laststatus=2 " display the status bar (filename)
set nobackup     " don't create annoying backup files
set noswapfile   " or swap files
set expandtab    " use spaces instead of tabs
set ai           " auto indent
set si           " smart indent
set wrap         " wrap lines
set autoread     " auto reload files when externally changed
set shortmess=I

au FocusLost * :wa " auto save files on lost focus
nnoremap <silent> <leader>n :nohlsearch<CR> " un-highlight search results
set mouse=a

" ruler
set colorcolumn=80
set ruler
set rulerformat=%l,%v

" tmux remaps
let g:tmux_navigator_no_mappings = 1

" Seemless tmux windows swithing
if exists('$TMUX')
  nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" Copy, Cut
set clipboard=unnamed

" Format json with node.js
nmap fj :<C-U>call FormatJSON(v:count)<CR>

function FormatJSON(...)
  let code="\"
        \ var i = process.stdin, d = '';
        \ i.resume();
        \ i.setEncoding('utf8');
        \ i.on('data', function(data) { d += data; });
        \ i.on('end', function() {
        \     console.log(JSON.stringify(JSON.parse(d), null,
        \ " . (a:0 ? a:1 ? a:1 : 2 : 2) . "));
        \ });\""
  execute "%! node -e " . code
endfunction

" NeoVim
if has('nvim')
  nmap <BS> <C-W>h
endif

" Extern
source ~/.dotfiles/.vimunite

