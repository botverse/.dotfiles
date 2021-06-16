" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" Open NERDTree on the right side
let g:NERDTreeWinPos = "right"

" === Nerdtree shorcuts === "
"  C-\ - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <silent> <C-\> :NERDTreeToggle<CR>
nmap <silent> <leader>f :NERDTreeFind<CR>

