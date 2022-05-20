syntax on

set number
set relativenumber

set cursorline
set nocursorcolumn

set wrap
set showcmd
set wildmenu

set hlsearch
exec "set nohlsearch"
set incsearch
set ignorecase
set smartcase

set mouse=a
set selection=exclusive
set selectmode=mouse,key

set scroll=8

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936  " 写入文件的文本编码
set termencoding=utf-8  " 输出到终端的文本编码
set encoding=utf-8      " 缓存区、寄存区的文本编码

set showmatch " 显示匹配括号

set shiftwidth=2 " 使用 >> 和 << 命令进行缩进和去缩进的宽度
set expandtab " 使用 tab 自动用空格替换
set tabstop=2 " 替换 tab 的空格个数
set autoindent " 继承前一行的缩进方式，另外 vim 还支持 smartindent 和 cindent 这两种缩进方式

" set list
set listchars=tab:>-,trail:-  " 显示空格和 tab 符号等非打印字符

set laststatus=2	" 总是显示状态栏
set ruler " 显示光标所在位置

filetype on " 自动检测文件类型，如果没有检测出来或检测结果错误，可以使用 :set filetype=cpp 来显示指定文件类型
filetype plugin on " 自动应用文件类型对应的插件
filetype indent on " 自动应用文件类型对应的缩进规则

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" set guifont=MesloLGLNerdFontComplete-Regular:h15
set guifont=Hack\ Nerd\ Font-Regular:h20
let g:gitgutter_override_sign_column_highlight = 1 
let g:gruvbox_transparent_bg = 1
augroup setcolorscheme
  autocmd!
  autocmd vimenter * ++nested colorscheme gruvbox
augroup END

" 配置文件修改立即生效
augroup autoreload
  autocmd!
  autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
augroup END

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  " onedark theme
  Plug 'joshdick/onedark.vim'
  Plug 'sheerun/vim-polyglot'
  " Plug 'valloric/youcompleteme'
  Plug 'skywind3000/asyncrun.vim'
  " switch cursor while focus/blur
  Plug 'sjl/vitality.vim'
  " directory tree
  Plug 'preservim/nerdtree'
  " directory tree node icon
  Plug 'ryanoasis/vim-devicons'
  " directory tree node hightlight
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
  " directory tree node git status
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " auto set/unset paste while pasting
  Plug 'ConradIrwin/vim-bracketed-paste'
  " navigator between vim and tmux
  Plug 'christoomey/vim-tmux-navigator'
  " coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " gruvbox theme 
  Plug 'morhetz/gruvbox'
  " scrollbar
  Plug 'Xuyuanp/scrollbar.nvim'
  " gitlens
  Plug 'APZelos/blamer.nvim'
call plug#end()

"状态信息加入vim-airline。
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '✘:'
let airline#extensions#coc#warning_symbol = '!:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" key mapping
let mapleader = "-"
let maplocalleader = "\\"
" x for backward delete, z for forward delete
nnoremap z i<BS><Esc>l
" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap jk <Esc>
inoremap hl <BS>
" inoremap <Esc> <Nop>
" inoremap <BS> <Nop>
" nmap    w=  :resize +3<CR>
" nmap    w-  :resize -3<CR>
" nmap    w,  :vertical resize -3<CR>
" nmap    w.  :vertical resize +3<CR>


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

if isdirectory(expand('~/.vim/plugged/scrollbar.nvim'))
  augroup scrollbar 
    autocmd!
    autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
    autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
  augroup end
endif

if isdirectory(expand('~/.vim/plugged/nerdtree'))
  augroup toggleNerdTree
    autocmd!
    " start NERDTreeToggleVCS when Vim is started without file arguments.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTreeToggleVCS | endif
  augroup END
  " Hide dir arrow and delimiter
  let g:NERDTreeDirArrowExpandable = "\u00a0"
  let g:NERDTreeDirArrowCollapsible = "\u00a0"
  let g:NERDTreeNodeDelimiter = "\x07"
  " Set show hidden files by default
  let NERDTreeShowHidden=1
  " Create default mappings
  let g:NERDCreateDefaultMappings = 1
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1
  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'
  " Set a language to use its alternate delimiters by default
  let g:NERDAltDelims_java = 1
  " Add your own custom formats or override the defaults
  let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1
  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1
  " Enable NERDCommenterToggle to check all selected lines is commented or not
  let g:NERDToggleCheckAllLines = 1
endif

if isdirectory(expand('~/.vim/plugged/vim-nerdtree-syntax-highlight'))
  " disabledD default folder color
  let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
  let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
  " let g:NERDTreeDisableFileExtensionHighlight = 1
  " let g:NERDTreeDisableExactMatchHighlight = 1
  " let g:NERDTreeDisablePatternMatchHighlight = 1
 " enables folder icon highlighting using exact match
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1
  let g:NERDTreeHighlightFolders = 1
  " highlights the folder name
  let g:NERDTreeHighlightFoldersFullName = 1 
endif

if isdirectory(expand('~/.vim/plugged/nerdtree-git-plugin'))
  let g:NERDTreeGitStatusIndicatorMapCustom = {
                   \ 'Modified'  :'✹',
                   \ 'Staged'    :'✚',
                   \ 'Untracked' :'✭',
                   \ 'Renamed'   :'➜',
                   \ 'Unmerged'  :'═',
                   \ 'Deleted'   :'✖',
                   \ 'Dirty'     :'✗',
                   \ 'Ignored'   :'☒',
                   \ 'Clean'     :'✔︎',
                   \ 'Unknown'   :'?',
                   \ }
  let g:NERDTreeGitStatusUseNerdFonts = 1
  let g:NERDTreeGitStatusShowClean = 1
endif

if isdirectory(expand('~/.vim/plugged/christoomey/vim-tmux-navigator'))
  let g:tmux_navigator_no_mappings = 1

  nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-\\> :TmuxNavigatePrevious<cr>
endif

if isdirectory(expand('~/.vim/plugged/coc.nvim'))
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  
  " Use <c-o> to trigger completion.
  inoremap <silent><expr> <c-o> coc#refresh()

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " 补全浮动窗显示时使用 j 和 k 移动选择
  inoremap <silent><expr> j pumvisible() ? "\<C-n>" : "j"
  inoremap <silent><expr> k pumvisible() ? "\<C-p>" : "k"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup coc
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd Filetype typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Run the Code Lens action on the current line.
  nmap <leader>cl  <Plug>(coc-codelens-action)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Cursor settings:
"  0 -> terminal default
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI .= "\<Esc>[5 q"
let &t_SR .= "\<Esc>[3 q"
let &t_EI .= "\<Esc>[2 q"
augroup autocursor
  autocmd!
  autocmd VimLeave * silent !echo -ne "\033[5 q"
  autocmd VimEnter * silent !echo -ne "\033[2 q"
augroup END

