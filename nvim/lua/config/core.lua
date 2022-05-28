local variables = {
  -- Numberline
  ['opt:number@'] = true,
  ['opt:relativenumber@'] = true,
  ['opt:numberwidth@'] = 2,
  ['opt:signcolumn@'] = 'yes',
  ['opt:wrap@'] = true,

  -- Indentline
  ['opt:expandtab@'] = true,
  ['opt:autoindent@'] = true,
  ['opt:shiftwidth@'] = 2,
  ['opt:smartindent@'] = true,
  ['opt:tabstop@'] = 2,

  -- Search
  ['opt:hlsearch@'] = false,
  ['opt:incsearch@'] = true,
  ['opt:ignorecase@'] = true,
  ['opt:smartcase@'] = true,

  -- Cursor
  ['opt:cursorline@'] = false,
  ['opt:cursorcolumn@'] = false,
  ['opt:ruler@'] = false, -- 显示光标位置信息

  -- Buffer & Swap
  ['opt:hidden@'] = true, -- 开启隐藏 buffer，在退出 vim 时会提示保存修改
  ['opt:updatetime@'] = 250, -- swap 文件写入硬盘的时间

  ['opt:mouse@'] = 'a', -- all modes
  ['opt:scroll@'] = 10, -- <C-u>/<C-d> 滚动行数

  ['opt:shortmess@append'] = 'sI', -- disable nvim intro

  ['opt:whichwrap@append'] = '<>[]hl', -- 行尾用 l 到下一行，行首用 h 到上一行

  -- Invisible char
  ['opt:list@'] = true,
  -- ['opt:listchars@'] = 'tab:>-,trail:-',

  ['opt:confirm@'] = true, -- use dialog to comfirm
  ['opt:laststatus@'] = 3, -- global statusbar

  ['opt:clipboard@'] = 'unnamedplus', -- use system clipboard as default register

  ['opt:splitbelow@'] = true,
  ['opt:splitright@'] = true,
  ['opt:termguicolors@'] = true,

  -- leader
  ['g:mapleader@'] = '.'
}

local mappings = {
  -- test
  ['n:<leader>n'] = { '<cmd> set nu! <CR>', 'toggle number option' },
  ['n:<leader>rn'] = { '<cmd> set rnu! <CR>', 'toggle relativenumber option' },

  -- disable arrow
  ['n:<Up>'] = { '<Nop>', 'disable <Up>' },
  ['n:<Down>'] = { '<Nop>', 'disable <Down>' },
  ['n:<Left>'] = { '<Nop>', 'disable <Left>' },
  ['n:<Right>'] = { '<Nop>', 'disable <Right>' },
  ['i:<Up>'] = { '<Nop>', 'disable <Up>' },
  ['i:<Down>'] = { '<Nop>', 'disable <Down>' },
  ['i:<Left>'] = { '<Nop>', 'disable <Left>' },
  ['i:<Right>'] = { '<Nop>', 'disable <Right>' },
  -- insert 模式下使用 Ctrl + hjkl 移动光标 
  ['i:<C-h>'] = { '<Left>', 'cursor left' },
  ['i:<C-l>'] = { '<Right>', 'cursor right' },
  ['i:<C-j>'] = { '<Down>', 'cursor down' },
  ['i:<C-k>'] = { '<Up>', 'cursor up' },

  -- switch between windows
  ['n:<C-h>'] = { '<C-w>h', ' window left' },
  ['n:<C-l>'] = { '<C-w>l', ' window right' },
  ['n:<C-j>'] = { '<C-w>j', ' window down' },
  ['n:<C-k>'] = { '<C-w>k', ' window up' },

  -- save
  ['n:<C-s>'] = { '<cmd> w <CR>', '﬚ save file' },

  -- Copy all
  ['n:<C-c>'] = { '<cmd> %y+ <CR>', ' copy whole file' },
}

local autocmds = {
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- local utils = require 'core.utils'
-- utils.autocmd({
--  event = 'BufWritePost',
--  pattern = 'packer.lua',
--  callback = function ()
--    vim.api.nvim_command('source <afile>')
--    vim.api.nvim_command('PackerSync')
--  end,
--})
}

local startup = function ()
  local packer = require 'packer'

  packer.init({
    git = { clone_timeout = 60000 },
    display = {
      working_sym = 'ﲊ',
      error_sym = '✗',
      done_sym = '✓'
    },
  })

  packer.startup(function()
    use {
      'wbthomason/packer.nvim',
    }

    use {
      'folke/tokyonight.nvim'
    }

    use {
      'eddyekofo94/gruvbox-flat.nvim'
    }

    use {
      'folke/which-key.nvim',
    }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
    }

    use {
      'akinsho/bufferline.nvim',
      tag = 'v2.*',
      requires = {
        'kyazdani42/nvim-web-devicons'
      }
    }

    use {
      'lewis6991/gitsigns.nvim',
    }

    use {
      'feline-nvim/feline.nvim',
    }

    use {
      "akinsho/toggleterm.nvim",
      tag = 'v1.*'
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = { 
        'nvim-lua/plenary.nvim'
      }
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
    }

    use {
      'neovim/nvim-lspconfig',
      requires = {
        'williamboman/nvim-lsp-installer',
      }
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use {
      'L3MON4D3/LuaSnip'
    }

    use {
      'rafamadriz/friendly-snippets',
    }

    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp', -- lsp
        'hrsh7th/cmp-buffer', -- buffer word
        'hrsh7th/cmp-path', -- paths
        'hrsh7th/cmp-cmdline', -- command line
      }
    }

  end)
end

local exports = {
  variables = variables,
  mappings = mappings,
  autocmds = autocmds,
  startup = startup,
}

return exports
