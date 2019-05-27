" ========================================================
" General settings
" ========================================================
set nocompatible              " be iMproved, required
set autoread                  " detect when a file is changed
set history=1000
set textwidth=120

set backupdir=~/.vim/tmp,~/.tmp,/var/tmp,/tmp
scriptencoding utf-8
set encoding=utf-8
filetype off                  " required

" ========================================================
" All plugins needed
" ========================================================

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Git stuff
Plug 'airblade/vim-gitgutter'

" Scala
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" JSON Comments highlighting 
autocmd FileType json syntax match Comment +\/\/.\+$+

" Mappings
map <C-n> :NERDTreeToggle<CR>

" ========================================================
" NERDTree configuration
" ========================================================
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimaUI = 1
let g:NERDTreeDirArrows = 1
let NERDTreeShowExecutableFlag = 0
" Prevent NerdTree from blocking tmux pane navigation on J and K
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""
