let g:UltiSnipsExpandTrigger = '<C-t>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.config/nvim/snippets"]
nnoremap <leader>u :call UltiSnips#RefreshSnippets()<Cr>
