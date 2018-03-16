"     My .vimrc
" ___________________
" Credit to:
" - http://amix.dk/vim/vimrc.html
" - http://nvie.com/posts/how-i-boosted-my-vim/
" - http://github.com/juco/dotfiles

" splash
set shortmess=I  " no intro message starting vim
autocmd VimEnter * if !argc() | e ~/.dotfiles/.vimsplash | endif

" autoload
call plug#begin('~/.local/share/nvim/plugged')

" Plugin list
Plug 'gmarik/Vundle.vim'
Plug 'wesQ3/vim-windowswap'             " window swap
Plug 'scrooloose/nerdtree'              " File browser
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
syntax enable
set background=dark
colorscheme solarized
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
highlight LineNr ctermfg=grey ctermbg=236

" Extra whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/

" Tabs
set expandtab    " use spaces instead of tabs
set tabstop=2
set shiftwidth=2

" Some more crucial settings
set clipboard=unnamed " copy cut to systems clipboard
set number
set relativenumber " relative line numbers
set showmatch    " show matching parenthesis
set smartcase    " search case-insensitive if everything is lower case
set hlsearch     " highlight search terms
set incsearch    " highlight search terms as you type
set title        " set the terminal title
set laststatus=2 " display the status bar (filename)
set nobackup     " don't create annoying backup files
set noswapfile   " or swap files
set ai           " auto indent
set si           " smart indent
set wrap         " wrap lines
set mouse=a      " enable mouse in neovim
set cursorline

" ruler
set colorcolumn=80
set ruler
set rulerformat=%l,%v

" esc
imap jj <Esc>

" un-highlight search results
nnoremap <silent> <leader>n :nohlsearch<CR>

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=50
autocmd StdinReadPre * let s:std_in=1
map <C-\> :NERDTreeToggle<CR>
nmap gn :NERDTreeFind<CR>

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

" Extern
source ~/.dotfiles/.vimunite

