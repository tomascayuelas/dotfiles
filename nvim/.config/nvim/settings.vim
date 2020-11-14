" ----------------------
" Global settings
" ----------------------
syntax on
set t_Co=256
set cursorline
colorscheme dracula
set hidden

" basic displays
set number
set ruler
set relativenumber
set cursorline
set scrolloff=3
set updatetime=300
set cmdheight=2

" show hidden whitespace
highlight ExtraWhitespace ctermbg=red guibg=red

" input settings
set autoindent
set smartindent
set nowrap
set mouse=a
set formatoptions-=cro
set clipboard=unnamedplus

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Title: turn on if tmux is ON
if !empty($TMUX)
  set title
endif

" encoding and line ending settings
if !has('nvim')
  set encoding=utf-8
endif
set fileencodings=utf-8,cp949,latin1
set fileformats=unix,dos

" swap and backup files
set noswapfile
set nobackup
set nowritebackup

" More history
set history=1000
set undolevels=100

" Other settings
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Help Vim recognize *.sbt and *.sc as Scala files
autocmd BufRead,BufNewFile *.sbt,*.sc set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+

" ----------------------
" Airline extensions
" ----------------------
let g:airline#extensions#tabline#enabled = 1

" ----------------------
" Fzf settings
" ----------------------
let $FZF_DEFAULT_COMMAND = 'rg --files'
let $FZF_DEFAULT_OPTS='-m --height 50% --border'

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Vim DevIcons
set guifont=:h
set guifont=DroidSansMono_Nerd_Font:h11

" Startify config
source ~/.config/nvim/startify.vim

