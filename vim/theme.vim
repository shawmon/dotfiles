Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'

set guifont=Hack\ Nerd\ Font-Regular:h20
set background=dark
let g:gitgutter_override_sign_column_highlight = 1 
let g:gruvbox_transparent_bg = 1
augroup setcolorscheme
  autocmd!
  autocmd vimenter * ++nested colorscheme gruvbox
augroup END

