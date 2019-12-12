call plug#begin('~/.local/share/nvim/plugged')

" Plugin list
Plug 'gmarik/Vundle.vim'
Plug 'wesQ3/vim-windowswap'             " window swap
Plug 'scrooloose/nerdtree'              " File browser
Plug 'vim-syntastic/syntastic'          " Syntax checking
Plug 'morhetz/gruvbox'                  " Palette
Plug 'christoomey/vim-tmux-navigator'   " Pane navigation tmux/vim
Plug 'Shougo/vimproc.vim', {'do': 'make' } " Async tasks
Plug 'Shougo/unite.vim'                 " Unite
Plug 'ervandew/supertab'                " Use Tab for everything
Plug 'editorconfig/editorconfig-vim'    " Editor config

" Autocomplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Language specific
Plug 'pangloss/vim-javascript'          " js
Plug 'mxw/vim-jsx'                      " jsx
Plug 'groenewege/vim-less'              " LESS
Plug 'styled-components/vim-styled-components' " styled-components

call plug#end()

" Tabs
set expandtab                 " use spaces instead of tabs
set tabstop=2
set shiftwidth=2
set list
set listchars=tab:➝\ ,extends:#,nbsp:. " mark the tabs
autocmd FileType go setlocal expandtab!

" Some more crucial settings
set nocompatible              " be iMproved, required
filetype off                  " required

set clipboard=unnamedplus,unnamed    " copy cut to systems clipboard
set clipboard+=unnamed
set number
set relativenumber            " relative line numbers
set showmatch                 " show matching parenthesis
set smartcase                 " search case-insensitive if everything is lower case
set hlsearch                  " highlight search terms
set incsearch                 " highlight search terms as you type
set title                     " set the terminal title
set laststatus=2              " display the status bar (filename)
set nobackup                  " don't create annoying backup files
set noswapfile                " or swap files
set ai                        " auto indent
set si                        " smart indent
set wrap                      " wrap lines
set mouse=a                   " enable mouse in neovim
" set cursorline

syntax enable

" ruler
highlight ColorColumn ctermbg=0
set colorcolumn=80
set ruler
set rulerformat=%l,%v

" shell
let &shell='bash --login'

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

" esc and tab
imap jj <Esc>
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Colorscheme
highlight LineNr ctermfg=grey ctermbg=236

" Extra whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\S\zs\s\+$/

" un-highlight search results
nnoremap <silent> <leader>n :nohlsearch<CR>

" splash
set shortmess=Ia  " no intro message starting vim
autocmd VimEnter * if !argc() | e ~/.dotfiles/.vimsplash | endif

" very magic mode in vim by default
nnoremap / /\v
nnoremap ? ?\v

" Extern
source ~/.dotfiles/nvim/langs.vim
source ~/.dotfiles/nvim/unite.vim
source ~/.dotfiles/nvim/nerdtree.vim

