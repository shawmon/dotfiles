Plug 'christoomey/vim-tmux-navigator'
if isdirectory(expand('~/.vim/plugged/christoomey/vim-tmux-navigator'))
  let g:tmux_navigator_no_mappings = 1

  nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-\\> :TmuxNavigatePrevious<cr>
endif

