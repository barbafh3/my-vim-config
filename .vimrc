execute pathogen#infect()
syntax on
filetype plugin indent on

let g:gruvbox_italic=1
colorscheme gruvbox

"colorscheme tone
"colorscheme goodwolf

autocmd VimEnter * NERDTree

cd /home/barbafh/Dev

set guifont=Source\ Code\ Pro\ 15 bg=dark splitbelow splitright

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
