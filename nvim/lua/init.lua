Core = {
  set = function(list)
    if not list then
      return
    end
    for _, option in pairs(list) do
      local type = option.type or 'option'
      local oper = option.oper or 'asign'

      local target = vim[type == 'variable' and 'g' or 'opt']
      if oper == 'append' then
        target[option.name]:append(option.value)
      elseif oper == 'prepend' then
        target[option.name]:prepend(option.value)
      else
        target[option.name] = option.value
      end
    end
  end,
  map = function(list)
    if not list then
      return
    end

    local whichkey = require 'which-key'

    for _, mapping in pairs(list) do
      local mode = mapping.mode or 'n'
      whichkey.register({ [mapping.key] = { mapping.action, mapping.desc } }, { mode = mode });
    end
  end,
}

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  print "Packer cloned successfully!"
end

require('packer').startup({
  function(use)
    -- local config_files = vim.split(vim.fn.glob('~/.config/nvim/lua/config/*lua'), '\n')
    local config_files = vim.fn.readdir(vim.fn.stdpath('config') ..'/lua/plugins', [[v:val =~ '\.lua$']])
    for _, file in pairs(config_files) do
      local plugin = require('plugins.' .. file:gsub('%.lua$', ''))
      if plugin then
        use(plugin)
      end
    end
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    },
  },
})
