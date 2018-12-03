set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'KabbAmine/vullScreen.vim'
Plugin 'alvan/vim-closetag'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

let g:gruvbox_italic=1
colorscheme gruvbox

"colorscheme tone
"colorscheme goodwolf

autocmd VimEnter * NERDTree
autocmd VimEnter * VullScreen

cd /home/barbafh/Dev

set guifont=Source\ Code\ Pro\ 15 
set bg=dark 
set splitbelow splitright 
set tabstop=4

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
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js'

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


