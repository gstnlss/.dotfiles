-- Fix for react type definition files showing on go to definition
-- https://github.com/typescript-language-server/typescript-language-server/issues/216
local function filter(arr, fn)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filter_react_dts(value)
  return string.match(value.filename, 'react/index.d.ts') == nil
end

local function on_list(options)
  local items = options.items
  if #items > 1 then
    items = filter(items, filter_react_dts)
  end

  vim.fn.setqflist(
    {}, ' ', { title = options.title, items = items, context = options.context }
  )
  vim.cmd('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end

return on_list
