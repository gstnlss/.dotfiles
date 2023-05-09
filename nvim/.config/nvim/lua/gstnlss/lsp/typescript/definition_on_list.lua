local filter_react_dts = require 'gstnlss.lsp.typescript.filter_react_dts'
local filter_cssmodules_dts = require 'gstnlss.lsp.typescript.filter_react_dts'

local function filter(arr)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for _, v in pairs(arr) do
    if filter_react_dts(v.filename) or filter_cssmodules_dts(v.filename) then
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
