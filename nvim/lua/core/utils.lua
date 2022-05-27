local exports = {}

local createAugroup = vim.api.nvim_create_angroup
local createAutocmd = vim.api.nvim_create_autocmd

local augroupMap = {}
exports.autocmd = function(options)
  event = options.event
  nested = options.nested
  callback = options.callback
  pattern = options.pattern

  group = augroupMap[options.group]
  if group then
    group = createAugroup(options.group, { clear = true })
    augroupMap[options.group] = group
  end

  createAutocmd(event, {
    nested = nested,
    group = group,
    callback = callback,
    pattern = pattern,
  })
end

exports.split = function (s, p)
    if s == nil then
        return nil;
    end
    if p == nil then
        return s;
    end
    local rt= {};
    s = tostring(s);
    string.gsub(s, '[^'..p..']+', function(w) table.insert(rt, w) end );
    return rt;
end

return exports

