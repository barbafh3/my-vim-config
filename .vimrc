"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" ____________________________

set encoding=UTF-8
scriptencoding utf-8
set termguicolors

" Better display for messages
set shortmess=a
set cmdheight=3

set mouse=a
set cursorline

" Source changes to init.vim
nnoremap <C-n> :so ~/.vimrc<CR>

set shell=/usr/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" " NerdTree plugins
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Ranger in vim
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" FZF for file search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" General code utilities
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
" Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'unblevable/quick-scope'

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'
Plug 'ryanoasis/vim-devicons'
Plug 'rafi/awesome-vim-colorschemes' "includes gruvbox

" GDScript
Plug 'clktmr/vim-gdscript3'
" Plug 'habamax/vim-godot'

" Love2D engine support
" Plug 'davisdude/vim-love-docs'

" C++
" Plug 'Yohannfra/Vim-Goto-Header'
" Plug 'JBakamovic/cxxd-vim'

" C# 
Plug 'OrangeT/vim-csharp'
Plug 'OmniSharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup'


" Prettier
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'branch': 'release/1.x',
      \ 'for': [
      \ 'gdscript3',
      \ 'javascript',
      \ 'typescript',
      \ 'csharp',
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
" set guifont=JetBrains\ Mono\ 14
" set guifont=Ubuntu\ Mono\ Regular\ 14
set bg=dark
set splitbelow splitright
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set number relativenumber
set noshowmode
set timeoutlen=300

"" let g:Hexokinase_highlighters = ['virtual']

" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='hard'

" colorscheme dracula

colorscheme gruvbox

set cursorline

" Airline settings
let g:airline_theme='gruvbox'
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

" Remap : to ;
nnoremap ; :

" Change 0 from line start to first non-space character
nnoremap 0 ^
vnoremap 0 ^

" set leader key to space
:let mapleader = " "
:let maplocalleader = "ç"

" Change tabs
nnoremap <leader><S-l> :tabn<CR>
nnoremap <leader><S-h> :tabp<CR>

" Change buffers
nnoremap <leader>l :bn<Cr>
nnoremap <leader>h :bp<Cr>

" Close buffer
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
let NERDTreeMapOpenInTab='<ENTER>'
nnoremap <leader>n :NERDTreeToggle<CR>

let g:sharpenup_map_prefix = ','

let g:UltiSnipsExpandTrigger = '<C-t>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.config/nvim/snippets"]
nnoremap <leader>u :call UltiSnips#RefreshSnippets()<Cr>

set listchars=tab:→\ ,trail:␣,extends:…,eol:⏎

silent! nmap <C-p> :GFiles --exclude-standard --others --cached<CR>

" Copy from neovim to system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from system clipboard to neovim
nnoremap <leader>p "+p
nnoremap <leader>P "+P

"""""""""""""""""""""""""""""""""""""""" GODOT


nnoremap <leader>gdr :call OpenMainScene()<CR><CR>
" nnoremap <leader>gdr :GodotRun<CR>

function!  OpenMainScene()
  let godot_version = ""
  if executable("godot")
    let godot_version = "godot"
  elseif executable("godot-mono")
    let godot_version = "godot-mono"
  endif
  if godot_version != ""
    let grep_value = system("grep run/main_scene ./project.godot | sed 's@run/main_scene=@@g' | sed 's@\"@@g'")
    execute "!" . godot_version . " " . grep_value
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""" MARKDOWN

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

"""""""""""""""""""""""""""""""""""""""""" OMNISHARP

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_server_use_mono = 1

autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>zz
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>zz
autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>zz
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>zz

"""""""""""""""""""""""""""""""""""""""""" COC.VIM
" Ctrl-Space open auto-complete panel
inoremap <silent><expr> <c-space> coc#refresh()

" Use j and k to cycle through auto-complete options
" when panel is open
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "<TAB>"
inoremap <expr> <M-j> pumvisible() ? "\<C-n>" : ""
inoremap <expr> <M-k> pumvisible() ? "\<C-p>" : ""

command! -nargs=0 Prettier :CocCommand prettier.formatFile

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight clear CursorLine
highlight Normal ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight NonText ctermbg=none
highlight SpecialKey ctermbg=none
highlight VertSplit ctermbg=none
highlight SignColumn ctermbg=none
