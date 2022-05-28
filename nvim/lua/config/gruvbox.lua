--[[
  @see https://github.com/eddyekofo94/gruvbox-flat.nvim
--]]
local variables = {
  ['g:gruvbox_flat_style@'] = 'dark',
  ['g:gruvbox_transparent@'] = false,
  ['g:gruvbox_italic_functions@'] = true,
  ['g:gruvbox_italic_variables@'] = true,
  ['g:gruvbox_dark_sidebar@'] = false,
  ['g:gruvbox_dark_sidebar@'] = false,
  -- ['g:gruvbox_sidebars@'] = { "qf", "vista_kind", "terminal", "packer" },
  ['g:gruvbox_sidebars@'] = {},
}

local mappings = {}

local autocmds = {}

local startup = function ()
  vim.cmd[[colorscheme gruvbox-flat]]
end

local exports = {
  variables = variables,
  mappings = mappings,
  autocmds = autocmds,
  startup = startup,
}

return exports

