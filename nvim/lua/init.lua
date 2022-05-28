local registerVariables = function (variables)
  if not variables then
    return
  end
  for name, variableValue in pairs(variables) do
    local variableType, variableName, variableOpt = string.match(name, '^(.*):(.*)@(.*)$')
    local target = vim[variableType and variableType or 'opt']
    if variableOpt == 'append' then
      target[variableName]:append(variableValue)
    elseif variableOpt == 'prepend' then
      target[variableName]:prepend(variableValue)
    else
      target[variableName] = variableValue
    end
  end
end

local registerMappings = function (mappings)
  if not mappings then
    return
  end

  local whichkey = require 'which-key'

  for name, mappingValue in pairs(mappings) do
    local mappingMode, mappingKey = string.match(name, '^(.*):(.*)$')
    whichkey.register({ [mappingKey] = mappingValue }, { mode = mappingMode });
  end
end

local registerAutocmds = function (autocmds)
  if not autocmds then
    return
  end

  -- TODO: 绑定自动任务
end

local startupComponent = function (startup)
  if not startup then
    return
  end

  startup()
end

local bootstrap = function ()
  local components = {}
  -- load components
  for _, name in pairs({
    'core',
    'which-key',
    'nvim-tree',
    --'tokyonight',
    'gruvbox',
    'bufferline',
    'feline',
    'gitsigns',
    'toggleterm',
    'telescope',
    'indentline',
  }) do
    components[name] = require('config.' .. name)
  end
  -- register variables
  for name, component in pairs(components) do
    registerVariables(component.variables)
  end
  -- register mappings
  for name, component in pairs(components) do
    registerMappings(component.mappings)
  end
  -- register autocmds
  for name, component in pairs(components) do
    registerAutocmds(component.autocmds)
  end
  -- startup component
  for name, component in pairs(components) do
    startupComponent(component.startup)
  end

end

local install = function ()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    print "Cloning packer ..."

    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

    print "Packer cloned successfully!"

    vim.cmd "packadd packer.nvim"

    vim.cmd "packerSync"
  end
end

install()
bootstrap()
