-- See https://github.com/lukas-reineke/indent-blankline.nvim
local variables = {
  ['opt:list@'] = true,
  -- ['opt:listchars@append'] = "space:⋅",
  -- ['opt:listchars@append'] = "eol:↴",
  -- ['opt:listchars@append'] = "trail:⋅",
  ['opt:listchars@'] = 'space: ,trail:⋅,eol:↴,nbsp:⋅',
}
local mappings = {
}

local autocmds = {}

local startup = function ()
  require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
  }
end

local exports = {
  variables = variables,
  mappings = mappings,
  autocmds = autocmds,
  startup = startup,
}
  
return exports
