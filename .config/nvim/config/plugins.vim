call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'voldikss/vim-floaterm'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
" Plug 'rafi/awesome-vim-colorschemes' "includes gruvbox
Plug 'dracula/vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'sheerun/vim-polyglot'
Plug 'neovimhaskell/haskell-vim'
Plug 'dkasak/gruvbox'
Plug 'gosukiwi/vim-atom-dark'

Plug 'habamax/vim-godot'

Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'

Plug 'cespare/vim-toml'
 
Plug 'rhysd/vim-clang-format'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
syntax on
