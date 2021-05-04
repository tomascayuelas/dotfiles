" vim-plug automatic installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('config') . '/autoload/bundle')

  " LSP - CoC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " File explorer
  Plug 'scrooloose/NERDTree'

  " Start screen and manage projects/files/bookmarks/etc...
  Plug 'mhinz/vim-startify'

  " Fuzzy search ...
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Re(undo) browser
  Plug 'mbbill/undotree'

  " DVCS - Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " ColorSchemes, bars, etc..
  Plug 'joshdick/onedark.vim' 
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Syntax
  Plug 'derekwyatt/vim-scala'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/vim-easy-align'
call plug#end()

" CoC - Extensions
let g:coc_global_extensions = [
  \'coc-metals',
  \'coc-go',
  \'coc-tsserver',
  \'coc-vetur',
  \'coc-pyright',
  \'coc-rust-analyzer',
  \'coc-sh',
  \'coc-html',
  \'coc-css',
  \'coc-json'
  \]
