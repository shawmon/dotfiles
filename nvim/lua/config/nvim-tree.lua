local variables = {
  ['g:nvim_tree_git_hl@'] = 1,
  ['g:nvim_tree_highlight_opened_files@'] = 1,
  ['g:nvim_tree_root_folder_modifier@'] = ':~',
  ['g:nvim_tree_add_trailing@'] = 1,
  ['g:nvim_tree_group_empty@'] = 1,
  ['g:nvim_tree_icon_padding@'] = ' ',
  ['g:nvim_tree_symlink_arrow@'] = ' >> ',
  ['g:nvim_tree_respect_buf_cwd@'] = 1,
  ['g:nvim_tree_create_in_closed_folder@'] = 1,
  ['g:nvim_tree_special_files@'] = {
    ['README.md'] = 1,
    ['Makefile'] = 1,
    ['MAKEFILE'] = 1,
  },
  ['g:nvim_tree_show_icons@'] = {
    ['git'] = 1,
    ['folders'] = 1,
    ['files'] = 1 ,
    ['folder_arrows'] = 1,
  },
  ['g:nvim_tree_icons@'] = {
    ['default'] = '',
    ['symlink'] = '',
    ['git'] = {
      ['unstaged'] = '✗',
      ['staged'] = '✓',
      ['unmerged'] = '',
      ['renamed'] = '➜',
      ['untracked'] = '★',
      ['deleted'] = '',
      ['ignored'] = '◌',
    },
    ['folder'] = {
      ['arrow_open'] = '', 
      ['arrow_closed'] = '',
      ['default'] = '',
      ['open'] = '',
      ['empty'] = '',
      ['empty_open'] = '',
      ['symlink'] = '',
      ['symlink_open'] = '',
    },
  },
  ['opt:termguicolors@'] = true,
}

local mappings = {
  -- toggle
  ["n:<C-n>"] = { "<cmd> NvimTreeToggle <CR>", " toggle nvimtree" },

  -- focus
  ["n:<leader>e"] = { "<cmd> NvimTreeFocus <CR>", " focus nvimtree" },
  -- More available functions:
  -- NvimTreeOpen
  -- NvimTreeClose
  -- NvimTreeFocus
  -- NvimTreeFindFileToggle
  -- NvimTreeResize
  -- NvimTreeCollapse
  -- NvimTreeCollapseKeepBuffers
}

local autocmds = {
}

local startup = function ()
  require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = 'name',
    update_cwd = false,
    reload_on_bufenter = false,
    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = 'yes',
      mappings = {
        custom_only = false,
        list = {
          -- user mappings go here
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = false,
        icons = {
          corner = '└ ',
          edge = '│ ',
          none = '  ',
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = 'before',
      },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = false,
      update_cwd = false,
      ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
      cmd = '',
      args = {},
    },
    diagnostics = {
      enable = false,
      show_on_dirs = false,
      icons = {
        hint = '',
        info = '',
        warning = '',
        error = '',
      },
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = {},
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 400,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = true,
        window_picker = {
          enable = true,
          chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
          exclude = {
            filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
            buftype = { 'nofile', 'terminal', 'help' },
          },
        },
      },
    },
    trash = {
      cmd = 'trash',
      require_confirm = true,
    },
    live_filter = {
      prefix = '[FILTER]: ',
      always_show_folders = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
      },
    },
  } -- END_DEFAULT_OPTS

  vim.cmd[[highlight NvimTreeFolderIcon guibg=blue]]
end

local exports = {
  variables = variables,
  mappings = mappings,
  autocmds = autocmds,
  startup = startup,
}

return exports
