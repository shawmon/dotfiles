-- See https://github.com/eddyekofo94/gruvbox-flat.nvim
local gruvbox_transparent = true
local gruvbox_theme = gruvbox_transparent and { NvimTreeNormal = {
  bg = 'none',
} } or {}

local variables = {
  ['g:gruvbox_flat_style@'] = 'dark',
  ['g:gruvbox_transparent@'] = gruvbox_transparent,
  ['g:gruvbox_italic_functions@'] = true,
  ['g:gruvbox_italic_variables@'] = true,
  ['g:gruvbox_dark_sidebar@'] = false,
  -- ['g:gruvbox_sidebars@'] = { "qf", "vista_kind", "terminal", "packer" },
  ['g:gruvbox_theme@'] = gruvbox_theme,
  ['g:gruvbox_colors@'] = {},
}

local mappings = {}

local autocmds = {}

local startup = function()
  vim.cmd [[colorscheme gruvbox-flat]]
  -- vim.cmd[[hi NvimTreeNormal guibg=none ctermbg=none]]
end

local exports = {
  variables = variables,
  mappings = mappings,
  autocmds = autocmds,
  startup = startup,
}

return exports
