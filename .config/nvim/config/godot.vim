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
