" variables
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

filetype on " 自动检测文件类型，如果没有检测出来或检测结果错误，可以使用 :set filetype=cpp 来显式指定文件类型
filetype plugin on " 自动应用文件类型对应的插件
filetype indent on " 自动应用文件类型对应的缩进规则

set hidden

set updatetime=100

set shortmess+=c

set signcolumn=yes

" key mappings
let mapleader = "-"
let maplocalleader = "\\"

nnoremap z i<BS><Esc>l

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


" autoreload
augroup autoreload
  autocmd!
  autocmd BufWritePost .vimrc,*.vim source $MYVIMRC
augroup END

