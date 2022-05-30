-- See https://github.com/akinsho/toggleterm.nvim
local variables = {}

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local mappings = {
  ["n:<C-t>"] = { "<cmd> ToggleTerm <CR>", "[toggleterm] toggle terminal window" },
  ["t:<C-t>"] = { "<cmd> ToggleTerm <CR>", "[toggleterm] toggle terminal window" },
 --  ["t:<C-x>"] = { termcodes "<C-\\><C-N>", "  escape terminal mode" },
}

local autocmds = {}

local startup = function ()
  require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    size = 30,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    direction = 'float',
    --direction = 'vertical' | 'horizontal' | 'tab' | 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      -- width = <value>,
      -- height = <value>,
      -- winblend = 3,
    }
  }
end

local exports = {
  variables = variables,
  mappings = mappings,
  autocmds = autocmds,
  startup = startup,
}
  
return exports
