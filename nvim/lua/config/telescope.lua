-- See https://github.com/nvim-telescope/telescope.nvim
local variables = {}

local mappings = {
  ['n:<leader>ff'] = { '<cmd>Telescope find_files<cr>', '[telescope] find files' },
  ['n:<leader>fb'] = { '<cmd>Telescope buffers<cr>', '[telescope] find buffers' },
  ['n:<leader>lg'] = { '<cmd>Telescope live_grep<cr>', '[telescope] live grep' },
}

local autocmds = {}

local startup = function ()
  require('telescope').setup{
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          -- ["<C-h>"] = "which_key"
        }
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }

  -- vim.system[[brew install ripgrep]]
end

local exports = {
  variables = variables,
  mappings = mappings,
  autocmds = autocmds,
  startup = startup,
}
  
return exports
