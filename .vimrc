"     My .vimrc
" ___________________
" Credit to:
" - http://amix.dk/vim/vimrc.html
" - http://nvie.com/posts/how-i-boosted-my-vim/
" - http://github.com/juco/dotfiles

autocmd VimEnter * if !argc() | e ~/.dotfiles/.vimintro | endif

" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Plugin list
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'              " File browser
Plugin 'jistr/vim-nerdtree-tabs'          " One NERDTree to rule the all
Plugin 'altercation/vim-colors-solarized' " Colours
Plugin 'christoomey/vim-tmux-navigator'   " Pane navigation tmux/vim
Plugin 'Shougo/vimproc.vim'               " Async tasks
Plugin 'Shougo/unite.vim'                 " Unite
Plugin 'yonchu/accelerated-smooth-scroll' " Smooth scroll

" Language specific
Plugin 'groenewege/vim-less'              " LESS
Plugin 'derekwyatt/vim-scala'             " Scala
Plugin 'octol/vim-cpp-enhanced-highlight' " C++

call vundle#end()
filetype plugin indent on

" Colorscheme
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
set background=dark
syntax enable
highlight LineNr ctermfg=grey ctermbg=236
set cursorline

" Tabs
set expandtab
set tabstop=2
set shiftwidth=2
set expandtab    " use spaces instead of tabs

" NERDTree
let g:NERDTreeWinSize=50
autocmd StdinReadPre * let s:std_in=1
map <C-\> :NERDTreeToggle<CR>

" Some more crucial settings
set relativenumber " relative line numbers 
set nowrap       " don't visually split long lines
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
au FocusLost * :wa
nnoremap <silent> <leader>n :nohlsearch<CR>
imap jj <Esc>
map fj :call FormatJSON()<CR>
set shortmess=I

" ruler
set colorcolumn=80
set ruler
set rulerformat=%l,%v

" tmux remaps
let g:tmux_navigator_no_mappings = 1

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Seemless tmux windows swithing
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

function FormatJSON() 
  let code="\"
        \ var i = process.stdin, d = '';
        \ i.resume();
        \ i.setEncoding('utf8');
        \ i.on('data', function(data) { d += data; });
        \ i.on('end', function() {
        \     console.log(JSON.stringify(JSON.parse(d), null, 2));
        \ });\""
  execute "%! node -e ".code 
endfunction

source ~/.dotfiles/.vimunite
