luafile ~/.dotfiles/nvim/config/lsp-compe.lua
luafile ~/.dotfiles/nvim/config/lsp-langs.lua

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> <leader>dd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>dD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>dr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>di <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" auto close qfix window after selecting
autocmd FileType qf if getwininfo(win_getid())[0].loclist | execute 'nnoremap <silent><buffer><tab> :.ll <bar> lclose<cr>' | end
autocmd FileType qf if !getwininfo(win_getid())[0].loclist | execute 'nnoremap <silent><buffer><tab> :.cc <bar> cclose<cr>' | end

" lua vim.lsp.util.close_preview_autocmd({"BufHidden", "BufLeave"})

" auto-format
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)


