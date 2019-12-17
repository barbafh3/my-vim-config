"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" ____________________________

set encoding=UTF-8
scriptencoding utf-8

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim'

" NerdTree plugins"
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" FZF for file search"
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'
Plug 'ryanoasis/vim-devicons'
Plug 'dylanaraps/wal.vim'
Plug 'sjl/badwolf'
Plug 'rafi/awesome-vim-colorschemes' "includes gruvbox

" " Highliting
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'kovetskiy/sxhkd-vim'

Plug 'sheerun/vim-polyglot'
Plug 'OrangeT/vim-csharp'
Plug 'mattn/emmet-vim'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }


" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
filetype on
syntax on

set guifont=Fira\ Code\ 14
set bg=dark
set splitbelow splitright
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set number relativenumber

"Set true colors to work with tmux aswell
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

highlight clear CursorLine
highlight Normal ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight NonText ctermbg=none
highlight SpecialKey ctermbg=none
highlight VertSplit ctermbg=none
highlight SignColumn ctermbg=none

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"colorscheme badwolf
"colorscheme wal

set noshowmode
set timeoutlen=300
"let g:airline_theme='wal'
let g:airline_theme='base16_gruvbox_dark_hard'
"let g:airline_theme='onedark'
"let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Removes arrow movement
vnoremap <Up> <NOP>
inoremap <Up> <NOP>
vnoremap <Down> <NOP>
inoremap <Down> <NOP>
vnoremap <Left> <NOP>
inoremap <Left> <NOP>
vnoremap <Right> <NOP>
inoremap <Right> <NOP>

nnoremap ; :

" Change 0 from line start to first non-space character
nnoremap 0 ^
vnoremap 0 ^

" set leader key to space
:let mapleader = " "

" Mappings for next buffer(bn), previous buffer(bp) and close buffer(bd)
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>d :bd<CR>

" Compile current C# file
nnoremap <leader>csc :!mcs %<CR>
" Run current file .exe 
nnoremap <leader>csr :!mono %:t:r.exe<CR>
" Compile and run C# file
nnoremap <leader>cscr :!mcs % && mono %:t:r.exe<CR>

" let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowLineNumbers=1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
nnoremap <leader>n :NERDTreeToggle<CR>

set list listchars=eol:\¬,tab:\|\·,trail:\·,space:\ 

silent! nmap <C-p> :GFiles --exclude-standard --others --cached<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP ~/Dev'

set guifont=Fira\ Code\ 14
set bg=dark 
set splitbelow splitright 
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set number relativenumber

"""""""""""""""""""""""""""""""""""""""""" COC.VIM

" Tab completion, completion confirm and snippet expand
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Better display for messages
set cmdheight=2

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

""""""""""""""""""""""""""""""""""""""""""""""" VIM-CLOSETAG

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified
" files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified
files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>`
" will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
        \ 'javascript.jsx': 'jsxRegion',
            \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag,
"  default is ''
"
let g:closetag_close_shortcut = '<leader>>'

