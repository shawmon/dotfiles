local variables = {
  ['g:tokyonight_style@'] = 'night',
  ['g:tokyonight_italic_functions@'] = true,
  ['g:tokyonight_sidebars@'] = { "qf", "vista_kind", "terminal", "packer" },
  ['g:tokyonight_colors@'] = { hint = "orange", error = "#ff0000" },
}

local mappings = {
}

local autocmds = {
}

local startup = function ()
  vim.cmd[[colorscheme tokyonight]]
end

local exports = {
  variables = variables,
  mappings = mappings,
  autocmds = autocmds,
  startup = startup,
}

return exports
  