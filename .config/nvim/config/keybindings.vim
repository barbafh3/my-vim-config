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
:let mapleader = " "
:let maplocalleader = "//"

" Change splits
nnoremap <leader>ll <C-w>l
nnoremap <leader>hh <C-w>h

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
