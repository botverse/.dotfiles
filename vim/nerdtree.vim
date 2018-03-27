" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=50
autocmd StdinReadPre * let s:std_in=1
map <C-\> :NERDTreeToggle<CR>
nmap gn :NERDTreeFind<CR>

" only one NERDTree
autocmd bufenter * if (!exists("t:NERDTreeBufName") ) | silent NERDTreeMirror | silent NERDTreeClose | endif

" autoclose on last
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif