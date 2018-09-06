if exists("g:loaded_nerdtree_custom_maps")
    finish
endif
let g:loaded_nerdtree_custom_maps = 1

call NERDTreeAddKeyMap({
        \ 'key': 'fs',
        \ 'callback': 'NERDTreeUniteGrep',
        \ 'quickhelpText': 'call unite for grep in current directory',
        \ 'override': 1,
        \ 'scope': 'DirNode' })

function! NERDTreeUniteGrep(dirnode)
    exec 'Unite -buffer-name=files grep:' . a:dirnode.path.str()
endfunction

