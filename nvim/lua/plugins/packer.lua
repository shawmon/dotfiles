return {
  'wbthomason/packer.nvim',
  config = function()
    Core.map({
      -- Disable arrow
      -- {
      --   mode = 'n',
      --   key = '<up>',
      --   action = '<nop>',
      --   desc = 'disable <up>',
      -- },
      -- {
      --   mode = 'n',
      --   key = '<down>',
      --   action = '<nop>',
      --   desc = 'disable <down>',
      -- },
      -- {
      --   mode = 'n',
      --   key = '<left>',
      --   action = '<nop>',
      --   desc = 'disable <left>',
      -- },
      -- {
      --   mode = 'n',
      --   key = '<right>',
      --   action = '<nop>',
      --   desc = 'disable <right>',
      -- },
      {
        mode = 'i',
        key = '<up>',
        action = '<nop>',
        desc = 'disable <up>',
      },
      {
        mode = 'i',
        key = '<down>',
        action = '<nop>',
        desc = 'disable <down>',
      },
      {
        mode = 'i',
        key = '<left>',
        action = '<nop>',
        desc = 'disable <left>',
      },
      {
        mode = 'i',
        key = '<right>',
        action = '<nop>',
        desc = 'disable <right>',
      },

      -- Insert 模式下使用 Ctrl + hjkl 移动光标
      {
        mode = 'i',
        key = '<c-h>',
        action = '<left>',
        desc = 'cursor left',
      },
      {
        mode = 'i',
        key = '<c-l>',
        action = '<right>',
        desc = 'cursor right',
      },
      {
        mode = 'i',
        key = '<c-j>',
        action = '<down>',
        desc = 'cursor down',
      },
      {
        mode = 'i',
        key = '<c-k>',
        action = '<up>',
        desc = 'cursor up',
      },
      -- Switch between windows
      {
        mode = 'n',
        key = '<c-h>',
        action = '<c-w>h',
        desc = 'window left',
      },
      {
        mode = 'n',
        key = '<c-l>',
        action = '<c-w>l',
        desc = 'window right',
      },
      {
        mode = 'n',
        key = '<c-j>',
        action = '<c-w>j',
        desc = 'window down',
      },
      {
        mode = 'n',
        key = '<c-k>',
        action = '<c-w>k',
        desc = 'window up',
      },
      -- Using Arrow key to resize window
      {
        mode = 'n',
        key = '<up>',
        action = '<cmd> resize +5<cr>',
        desc = 'window resize up',
      },
      {
        mode = 'n',
        key = '<down>',
        action = '<cmd> resize -5<cr>',
        desc = 'window resize down',
      },
      {
        mode = 'n',
        key = '<left>',
        action = '<cmd> vertical resize -5<cr>',
        desc = 'window resize left',
      },
      {
        mode = 'n',
        key = '<right>',
        action = '<cmd> vertical resize +5<cr>',
        desc = 'window resize right',
      },

      -- Save & Copy all
      {
        mode = 'n',
        key = '<c-s>',
        action = '<cmd> w <cr>',
        desc = 'save file',
      },
      {
        mode = 'n',
        key = '<c-c>',
        action = '<cmd> %y+ <cr>',
        desc = 'copy file',
      },

      -- Quick Escape
      {
        mode = 'i',
        key = '<c-e>',
        action = '<esc>',
        desc = 'quick escape',
      },
    })

    Core.set({
      {
        name = 'number',
        value = true,
        type = 'option',
      },
      -- },
      -- Numberline
      {
        name = 'number',
        value = true,
        type = 'option',
      },
      {
        name = 'relativenumber',
        value = true,
        type = 'option',
      },
      {
        name = 'numberwidth',
        value = 2,
        type = 'option',
      },
      {
        name = 'signcolumn',
        value = 'yes',
        type = 'option',
      },
      {
        name = 'wrap',
        value = true,
        type = 'option',
      },
      -- Indentline
      {
        name = 'expandtab',
        value = true,
        type = 'option',
      },
      {
        name = 'autoindent',
        value = true,
        type = 'option',
      },
      {
        name = 'shiftwidth',
        value = 2,
        type = 'option',
      },
      {
        name = 'smartindent',
        value = true,
        type = 'option',
      },
      {
        name = 'tabstop',
        value = 2,
        type = 'option',
      },
      -- Search
      {
        name = 'hlsearch',
        value = false,
        type = 'option',
      },
      {
        name = 'incsearch',
        value = true,
        type = 'option',
      },
      {
        name = 'ignorecase',
        value = true,
        type = 'option',
      },
      {
        name = 'smartcase',
        value = true,
        type = 'option',
      },
      -- Cursor
      {
        name = 'cursorline',
        value = false,
        type = 'option',
      },
      {
        name = 'cursorcolumn',
        value = false,
        type = 'option',
      },
      {
        name = 'ruler', -- 显示光标位置信息
        value = false,
        type = 'option',
      },
      -- Buffer & Swap
      {
        name = 'hidden', -- 开启隐藏 buffer，在退出 vim 时会提示保存修改
        value = true,
        type = 'option',
      },
      {
        name = 'updatetime', -- swap 文件写入硬盘的时间
        value = 250,
        type = 'option',
      },

      {
        name = 'mouse', -- all modes
        value = 'a',
        type = 'option',
      },
      {
        name = 'scroll', -- <C-u>/<C-d> 滚动行数
        value = 10,
        type = 'option',
      },
      {
        name = 'shortmess', -- disable nvim intro
        value = 'sI',
        type = 'option',
        oper = 'append',
      },
      {
        name = 'whichwrap', -- 行尾用 l 到下一行，行首用 h 到上一行
        value = '<>[]hl',
        type = 'option',
        oper = 'append',
      },

      -- Invisible char
      {
        name = 'list',
        value = true,
        type = 'option',
      },
      {
        name = 'listchars',
        value = 'tab:»_,space:⋅,trail:⋅,eol:↴,nbsp:⋅',
        type = 'option',
      },
      -- Dialog & Statusbar & Bottom
      {
        name = 'confirm', -- use dialog to comfirm
        value = true,
        type = 'option',
      },
      {
        name = 'laststatus', -- global statusbar
        value = 3,
        type = 'option',
      },
      {
        name = 'termguicolors',
        value = true,
        type = 'option',
      },
      {
        name = 'showmode',
        value = true,
        type = 'option',
      },
      {
        name = 'showcmd',
        value = true,
        type = 'option',
      },

      -- Clipboard
      {
        name = 'clipboard', -- use system clipboard as default register
        value = 'unnamedplus',
        type = 'option',
      },
      -- Split
      {
        name = 'splitbelow',
        value = true,
        type = 'option',
      },
      {
        name = 'splitright',
        value = true,
        type = 'option',
      },
      -- Leader
      {
        name = 'mapleader',
        value = ' ',
        type = 'variable',
      },
    })

-- " Cursor settings:
-- "  0 -> terminal default
-- "  1 -> blinking block
-- "  2 -> solid block
-- "  3 -> blinking underscore
-- "  4 -> solid underscore
-- "  5 -> blinking vertical bar
-- "  6 -> solid vertical bar
-- let &t_SI .= "\<Esc>[5 q"
-- let &t_SR .= "\<Esc>[3 q"
-- let &t_EI .= "\<Esc>[2 q"
-- vim.cmd([[
-- augroup autocursor
--   autocmd!
--   autocmd VimLeave * silent !echo -ne "\033[5 q"
--   autocmd VimEnter * silent !echo -ne "\033[2 q"
-- augroup END
-- ]])

    require('packer').init({
      git = { clone_timeout = 60000 },
      display = {
        working_sym = 'ﲊ',
        error_sym = '✗',
        done_sym = '✓'
      },
    })
  end
}
