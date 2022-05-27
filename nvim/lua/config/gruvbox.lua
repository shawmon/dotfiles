local variables = {
  ['g:gruvbox_flat_style@'] = 'dark',
}

local mappings = {
}

local autocmds = {
}

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
