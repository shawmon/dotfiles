local variables = {
  -- Emulate Normal Text Editor
  -- ['opt:insertmode@'] = true,
  -- ['opt:selectmode@'] = 'mouse',

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

  -- Bottom & Status Bar
  ['opt:showmode@'] = true,
  ['opt:showcmd@'] = true,


  -- leader
  ['g:mapleader@'] = ' ',
}

local mappings = {
  -- Disable arrow
  ['n:<Up>'] = { '<Nop>', '[core] disable <Up>' },
  ['n:<Down>'] = { '<Nop>', '[core] disable <Down>' },
  ['n:<Left>'] = { '<Nop>', '[core] disable <Left>' },
  ['n:<Right>'] = { '<Nop>', '[core] disable <Right>' },
  ['i:<Up>'] = { '<Nop>', '[core] disable <Up>' },
  ['i:<Down>'] = { '<Nop>', '[core] disable <Down>' },
  ['i:<Left>'] = { '<Nop>', '[core] disable <Left>' },
  ['i:<Right>'] = { '<Nop>', '[core] disable <Right>' },
  -- Insert 模式下使用 Ctrl + hjkl 移动光标
  ['i:<C-h>'] = { '<Left>', '[core] cursor left' },
  ['i:<C-l>'] = { '<Right>', '[core] cursor right' },
  ['i:<C-j>'] = { '<Down>', '[core] cursor down' },
  ['i:<C-k>'] = { '<Up>', '[core] cursor up' },

  -- Switch between windows
  ['n:<C-h>'] = { '<C-w>h', '[core] window left' },
  ['n:<C-l>'] = { '<C-w>l', '[core] window right' },
  ['n:<C-j>'] = { '<C-w>j', '[core] window down' },
  ['n:<C-k>'] = { '<C-w>k', '[core] window up' },

  -- Save & Copy all
  ['n:<C-s>'] = { '<cmd> w <CR>', '[core] save file' },
  ['n:<C-c>'] = { '<cmd> %y+ <CR>', '[core] copy whole file' },

  -- Quick Escape
  ['i:<C-e>'] = { '<Esc>', '[core] quick escape' },
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

local startup = function()
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

    use {
      'windwp/nvim-autopairs'
    }

    use {
      'ray-x/lsp_signature.nvim'
    }

    use {
      'rlue/vim-barbaric'
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
