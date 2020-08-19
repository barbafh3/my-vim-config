let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
" let g:OmniSharp_server_use_mono = 1

" func YCMFormat()
"   exec "YcmCompleter Format"
" endfunction

" autocmd BufWritePre <buffer> call :OmniSharpCodeFormat
" autocmd FileType cs autocmd BufWritePre <buffer> call YCMFormat()
" autocmd InsertLeave cs :YcmCompleter Format

" let g:ale_linters = {
" \ 'cs': ['OmniSharp']
" \}

autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
autocmd FileType cs nmap <silent> <buffer> <Leader>ac <Plug>(omnisharp_code_actions)
autocmd FileType cs nmap <silent> <buffer> <Leader>fx <Plug>(omnisharp_fix_usings)
autocmd FileType cs nmap <silent> <buffer> <Leader>rn <Plug>(omnisharp_rename)
