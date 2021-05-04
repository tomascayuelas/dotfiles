let g:NERDTreeMouseMode = 3 " Single-click behaviour 

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Autorefresh hack
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
