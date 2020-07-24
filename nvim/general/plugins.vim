" Plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Themes
    Plug 'joshdick/onedark.vim'

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " File Explorer
    Plug 'preservim/nerdtree'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Keeping up to date with master
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    " Airline and Airline themes
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Vim-commentary
    Plug 'tpope/vim-commentary'

    " Adding color with colorizer & rainbow
    Plug 'norcalli/nvim-colorizer.lua'

    " Extras to remove....
    Plug 'SirVer/ultisnips'
    Plug 'phux/vim-snippets'
    Plug 'ncm2/ncm2'
    Plug 'ncm2/ncm2-ultisnips'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'

    Plug 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php'}
    Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
    Plug 'StanAngeloff/php.vim', {'for': 'php'}
    Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}

    Plug 'w0rp/ale'

    Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
    Plug 'alvan/vim-php-manual', {'for': 'php'}

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'pbogut/fzf-mru.vim'

    " only show MRU files from within your cwd
    let g:fzf_mru_relative = 1

    Plug 'amiorin/vim-project'
call plug#end()
