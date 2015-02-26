"     My .vimrc
" ___________________
" Credit to:
" - http://amix.dk/vim/vimrc.html
" - http://nvie.com/posts/how-i-boosted-my-vim/
" - http://github.com/juco/dotfiles

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

" Language specific
Plugin 'tpope/vim-rails'                  " Rails FTW
Plugin 'groenewege/vim-less'              " LESS
Plugin 'cakebaker/scss-syntax.vim'        " SCSS
Plugin 'derekwyatt/vim-scala'             " Scala

call vundle#end()
filetype plugin indent on

" Colorscheme
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=dark
colorscheme solarized
syntax on

" Tabs
set expandtab
set tabstop=2
set shiftwidth=2
set expandtab    " use spaces instead of tabs

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-\> :NERDTreeToggle<CR>

" Some more crucial settings
set number       " show line numbers
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

" ruler
set colorcolumn=80

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
