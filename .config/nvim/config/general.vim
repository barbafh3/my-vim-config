set encoding=UTF-8
set termguicolors
set shortmess=a
set cmdheight=3
set mouse=a
set cursorline
set guifont=Fira\ Code\ 14
set bg=dark
set splitbelow splitright
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number relativenumber
set noshowmode
set listchars=tab:→\ ,trail:␣,extends:…,eol:⏎
set signcolumn=yes
" set colorcolumn=125

" C++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Haskell 
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1

" C#
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2

" Ultisnips
let g:UltiSnipsExpandTrigger = '<C-t>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.config/nvim/snippets"]

" highlight clear CursorLine
" highlight Normal ctermbg=none
" highlight LineNr ctermbg=none
" highlight Folded ctermbg=none
" highlight NonText ctermbg=none
" highlight SpecialKey ctermbg=none
" highlight VertSplit ctermbg=none
" highlight SignColumn ctermbg=none

" highlight Function cterm=bold
" highlight Identifier cterm=bold
