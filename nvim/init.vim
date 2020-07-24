" --- Plugins and plugins config
source ~/.config/nvim/general/plugins.vim
source ~/.config/nvim/plug-config/coc.vim

" --- General Settings
source ~/.config/nvim/general/settings.vim

" --- Keys
source ~/.config/nvim/keys/mappings.vim

" --- Themes and Aspect
source ~/.config/nvim/themes/onedark.vim
source ~/.config/nvim/themes/airline.vim
lua require'plug-colorizer'


let g:project_use_nerdtree = 1
let g:project_enable_welcome = 1
set rtp+=~/.config/nvim/plugged/nvim-project/

" Nerdtree to avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
" PHP Documentation under cursor
let g:php_manual_online_search_shortcut = '<leader>k'

" Util Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" PHP7
let g:ultisnips_php_scalar_types = 1

augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupClose set completeopt=menuone
augroup END

" parameter expansion for selected entry via Enter
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

" cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"


" disable linting while typing
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 5
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
  \}
let g:ale_fix_on_save = 1

" php-cs-fixer
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <c-s> <esc>:w<cr>:Silent php-cs-fixer fix %:p --level=symfony<cr>

" PHP Refactoring
let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility = 'private'
let g:vim_php_refactoring_auto_validate_visibility = 1
let g:vim_php_refactoring_phpdoc = "pdv#DocumentCurrentLine"
let g:vim_php_refactoring_use_default_mapping = 0

nnoremap <leader>rlv :call PhpRenameLocalVariable()<CR>
nnoremap <leader>rcv :call PhpRenameClassVariable()<CR>
nnoremap <leader>rrm :call PhpRenameMethod()<CR>
nnoremap <leader>reu :call PhpExtractUse()<CR>
vnoremap <leader>rec :call PhpExtractConst()<CR>
nnoremap <leader>rep :call PhpExtractClassProperty()<CR>
nnoremap <leader>rnp :call PhpCreateProperty()<CR>
nnoremap <leader>rdu :call PhpDetectUnusedUseStatements()<CR>
nnoremap <leader>rsg :call PhpCreateSettersAndGetters()<CR>


" PHPActor
let g:phpactor_executable = '~/.config/nvim/plugged/phpactor/bin/phpactor'
" context-aware menu with all functions (ALT-m)
nnoremap <m-m> :call phpactor#ContextMenu()<cr>

nnoremap gd :call phpactor#GotoDefinition()<CR>
nnoremap gr :call phpactor#FindReferences()<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" extract variable
vnoremap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
nnoremap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" extract interface
nnoremap <silent><Leader>rei :call phpactor#ClassInflect()<CR>

" PHP Helpers
function! PHPModify(transformer)
    :update
    let l:cmd = "silent !".g:phpactor_executable." class:transform ".expand('%').' --transform='.a:transformer
    execute l:cmd
endfunction

nnoremap <leader>rcc :call PhpConstructorArgumentMagic()<cr>
function! PhpConstructorArgumentMagic()
    " update phpdoc
    if exists("*UpdatePhpDocIfExists")
        normal! gg
        /__construct
        normal! n
        :call UpdatePhpDocIfExists()
        :w
    endif
    :call PHPModify("complete_constructor")
endfunction

nnoremap <leader>ric :call PHPModify("implement_contracts")<cr>
nnoremap <leader>raa :call PHPModify("add_missing_properties")<cr>

nnoremap <leader>rmc :call PHPMoveClass()<cr>
function! PHPMoveClass()
    :w
    let l:oldPath = expand('%')
    let l:newPath = input("New path: ", l:oldPath)
    execute "!".g:phpactor_executable." class:move ".l:oldPath.' '.l:newPath
    execute "bd ".l:oldPath
    execute "e ". l:newPath
endfunction

nnoremap <leader>rmd :call PHPMoveDir()<cr>
function! PHPMoveDir()
    :w
    let l:oldPath = input("old path: ", expand('%:p:h'))
    let l:newPath = input("New path: ", l:oldPath)
    execute "!".g:phpactor_executable." class:move ".l:oldPath.' '.l:newPath
endfunction

nnoremap <leader>s :Rg<space>
" word under cursor
nnoremap <leader>R :exec "Rg ".expand("<cword>")<cr>
" search for visual selection
vnoremap // "hy:exec "Rg ".escape('<C-R>h', "/\.*$^~[()")<cr>

autocmd! VimEnter * command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --smart-case --line-number --color=always --no-heading --fixed-strings --follow --glob "!.git/*" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <C-,> :Files<cr>
" vertical split
nnoremap <leader>. :call fzf#run({'sink': 'e', 'right': '40%'})<cr>
nnoremap <leader>d :BTags<cr>
" word under cursor
nnoremap <leader>D :BTags <C-R><C-W><cr>
nnoremap <leader>S :Tags<cr>
" hit enter to jump to last buffer
nnoremap <leader><tab> :Buffers<cr>

" NERDTree
map <C-n> :NERDTreeToggle<CR>
