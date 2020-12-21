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
  Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'} 

  " File explorer
  Plug 'weirongxu/coc-explorer'

  " Start screen and manage projects/files/bookmarks/etc...
  Plug 'mhinz/vim-startify'

  " Fuzzy search ...
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " DVCS - Git
  Plug 'tpope/vim-fugitive'

  " ColorSchemes, bars, etc..
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'

  " Syntax
  Plug 'derekwyatt/vim-scala'
  Plug 'jiangmiao/auto-pairs'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
