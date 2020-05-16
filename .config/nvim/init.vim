"   _   _                 _           
"  | \ | |               (_)          
"  |  \| | ___  _____   ___ _ __ ___  
"  | . ` |/ _ \/ _ \ \ / / | '_ ` _ \ 
"  | |\  |  __/ (_) \ V /| | | | | | |
"  |_| \_|\___|\___/ \_/ |_|_| |_| |_|
"                                    
" _____________________________________


" General configurations
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/keybinds.vim

" Plugin specific configurations and keybindings
source $HOME/.config/nvim/nerdtree.vim
source $HOME/.config/nvim/ultisnips.vim
source $HOME/.config/nvim/godot.vim
source $HOME/.config/nvim/omnisharp.vim
source $HOME/.config/nvim/coc.vim


" highlight clear CursorLine
highlight Normal ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight NonText ctermbg=none
highlight SpecialKey ctermbg=none
highlight VertSplit ctermbg=none
highlight SignColumn ctermbg=none
