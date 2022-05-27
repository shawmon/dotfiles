" VS Code Gitlens plugin
Plug 'APZelos/blamer.nvim'

if isdirectory(expand('~/.vim/plugged/blamer.nvim'))
  let g:blamer_enabled = 1
  let g:blamer_delay = 500
  let g:blamer_show_in_visual_modes = 0
  let g:blamer_show_in_insert_modes = 0
  let g:blamer_prefix = '          '
  let g:blamer_template = '<committer>, <committer-time> • <summary>'
  let g:blamer_date_format = '%d/%m/%y %H:%M'
  let g:blamer_relative_time = 1
  " highlight Blamer guifg=lightgrey
  highlight link Blamer Comment
endif
