return {
  'folke/which-key.nvim',
  config = function()
    Core.set({
      {
        name = 'timeoutlen',
        value = 500,
        type = 'option',
      },
    });

    Core.map({
      {
        mode = 'n',
        key = '<leader>wK',
        action = function()
          vim.cmd "WhichKey"
        end,
        desc = 'all keymaps',
      },
      {
        mode = 'n',
        key = '<leader>wk',
        action = function()
          local input = vim.fn.input "WhichKey: "
          vim.cmd("WhichKey " .. input)
        end,
        desc = 'query lookup',
      },
    })

    local whichkey = require 'which-key'
    local options = {
      icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '  ', -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
      },
      window = {
        border = 'none', -- none/single/double/shadow
      },
      layout = {
        spacing = 6, -- spacing between columns
      },
      hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' },

      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        i = { 'j', 'k' },
        v = { 'j', 'k' },
      },
    }
    whichkey.setup(options)
  end
}
