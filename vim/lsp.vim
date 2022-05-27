Plug 'neovim/nvim-lspconfig'

augroup lspsetup
  autocmd!
  autocmd VimEnter * ! lua require('lsp-setup')
augroup END

