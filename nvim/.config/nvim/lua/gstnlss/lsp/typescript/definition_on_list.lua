local is_react_dts = function(item)
  return string.match(item.filename, 'react/index%.d%.ts') ~= nil or string.match(item.filename, 'lib/react%-app%.d%.ts') ~= nil
end

local function filter(arr)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for _, v in pairs(arr) do
    if not is_react_dts(v) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function on_list(options)
  local items = filter(options.items)

  if #items > 0 then
    vim.fn.setqflist(
      {}, 'r',
      { title = options.title, items = items, context = options.context }
    )
    vim.cmd('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
    return
  end

  vim.fn.setqflist({}, 'r', { items = {}, context = options.context })
end

return on_list
