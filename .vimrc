set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'KabbAmine/vullScreen.vim'
Plugin 'alvan/vim-closetag'
Plugin 'vim-syntastic/syntastic'
"Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

"Set true colors to work with tmux aswell
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

execute pathogen#infect()
syntax on
filetype plugin indent on

"let g:gruvbox_italic=1
"colorscheme gruvbox
colorscheme solarized8

"colorscheme tone
"colorscheme goodwolf

autocmd VimEnter * NERDTree
autocmd VimEnter * VullScreen

cd /home/barbafh/Dev

set guifont=SauceCodePro\ Nerd\ Font\ Bold\ 14
set bg=dark 
set splitbelow splitright 
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set number

let g:vrc_curl_opts = {
  \ '--connect-timeout' : 10,
  \ '-b': '/path/to/cookie',
  \ '-c': '/path/to/cookie',
  \ '-L': '',
  \ '-i': '',
  \ '--max-time': 60,
  \ '--ipv4': '',
  \ '-k': '',
\}

autocmd BufNewFile,BufRead *.http set syntax=rest ft=rest

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O<TAB>
inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O<TAB>
inoremap [ []<Left>
inoremap [<CR> [<CR>]<Esc>O<TAB>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>'')'')

nnoremap <leader>n :NERDTreeToggle<CR>
vnoremap <leader>dq :s/\%V\(.*\)\%V/"\1"/<CR>
vnoremap <leader>sq :s/\%V\(.*\)\%V/'\1'/<CR>
vnoremap <leader>p :s/\%V\(.*\)\%V/(\1)/<CR>
vnoremap <leader>b :s/\%V\(.*\)\%V/{\1}/<CR>




" Closes ) and ], ignoring it if they are already present
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf


" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.snippet'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,snippet'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


