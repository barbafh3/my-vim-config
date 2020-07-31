let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_server_use_mono = 1

autocmd BufWritePre <buffer> call :OmniSharpCodeFormat

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>zz
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>zz
autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>zz
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>zz
