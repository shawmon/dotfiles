-- https://github.com/nvim-telescope/telescope.nvim
return {
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    Core.map({
      {
        mode = 'n',
        key = '<leader>ff',
        action = '<cmd>Telescope find_files<cr>',
        desc = 'telescope find files',
      },
      {
        mode = 'n',
        key = '<leader>fb',
        action = '<cmd>Telescope buffers<cr>',
        desc = 'telescope find buffers',
      },
      {
        mode = 'n',
        key = '<leader>lg',
        action = '<cmd>Telescope live_grep<cr>',
        desc = 'telescope live grep',
      },
    })

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
}
