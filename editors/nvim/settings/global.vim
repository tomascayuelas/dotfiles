" Global settings
set number
set ruler
set relativenumber
set scrolloff=3
set t_Co=256
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set updatetime=300                      " Faster completion
set background=dark                     " tell vim what the background color looks like
set cursorline                          " Enable highlighting of the current line
set cmdheight=2                         " More space for displaying messages
set nowrap                              " Display long lines as just one line
set pumheight=10                        " Makes popup menu smaller
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set laststatus=0                        " Always display the status line
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set hidden
"set autochdir                           " Your working directory will always be the same as your working directory

" show hidden whitespace
highlight ExtraWhitespace ctermbg=red guibg=red

" input settings
set autoindent
set smartindent
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set mouse=a                             " Enable your mouse
set formatoptions-=cro
set clipboard=unnamedplus
set iskeyword+=-                      	" treat dash separated words as a word text object"
set expandtab                           " Converts tabs to spaces

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" encoding and line ending settings
if !has('nvim')
  set encoding=utf-8
endif
set fileencodings=utf-8
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

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

filetype plugin on
