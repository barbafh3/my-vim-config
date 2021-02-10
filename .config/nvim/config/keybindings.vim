" Source changes to init.vim
nnoremap <C-n> :so ~/.config/nvim/init.vim<Cr>

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
let mapleader = " "
let maplocalleader = "//"

" Change splits
nnoremap <leader><leader>l <C-w>l
nnoremap <leader><leader>h <C-w>h

" Change tabs
nnoremap <leader><S-l> :tabn<CR>
nnoremap <leader><S-h> :tabp<CR>

" Change buffers
nnoremap <leader>l :bn<Cr>
nnoremap <leader>h :bp<Cr>

" Close buffer
nnoremap <leader>d :bd<CR>

" silent! nmap <Leader>f :GFiles --exclude-standard --others --cached<CR>
silent! nmap <C-p> :GFiles --exclude-standard --others --cached<CR>
silent! nmap <Leader>fz :pwd \| Files<CR>

" Copy from neovim to system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from system clipboard to neovim
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Run monogame project
nnoremap <leader>mg !dotnet run

" Easy motions
map <Leader><Leader>w <Plug>(easymotion-bd-w)

" Run cargo on current folder
nnoremap <Leader>cr :!cargo run<CR>
" Run cargo on the current folder using Floaterm
nnoremap <Leader>fcr :FloatermNew --autoclose=2 cargo run<CR>

" C/C++ formatting with llvm
nnoremap <Leader>fc :<C-u>ClangFormat<CR>

" Godot
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

" C#
autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
autocmd FileType cs nmap <silent> <buffer> <Leader>ac <Plug>(omnisharp_code_actions)
autocmd FileType cs nmap <silent> <buffer> <Leader>fx <Plug>(omnisharp_fix_usings)
autocmd FileType cs nmap <silent> <buffer> <Leader>rn <Plug>(omnisharp_rename)

" Coc.nvim

" Ctrl-Space open auto-complete panel
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use j and k to cycle through auto-complete options
" when panel is open
inoremap <expr> <M-j> pumvisible() ? "\<C-n>" : ""
inoremap <expr> <M-k> pumvisible() ? "\<C-p>" : ""

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

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Open coc-explorer
nmap <silent> <leader>e :CocCommand explorer<CR>

" Ultisnips
nnoremap <leader>u :call UltiSnips#RefreshSnippets()<Cr>
