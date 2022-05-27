Plug 'Xuyuanp/scrollbar.nvim'
if isdirectory(expand('~/.vim/plugged/scrollbar.nvim'))
  augroup scrollbar 
    autocmd!
    autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
    autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
  augroup end
end
