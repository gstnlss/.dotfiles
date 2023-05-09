local function definition_on_list(options)
  local items = options.items

  if #items == 1 and string.match(items[1].filename, 'react-app.d.ts') then
    print('cssmodules if')
    -- vim.fn.setqflist(
    --   {}, ' ', { title = options.title, items = {}, context = options.context }
    -- )
  end
end

local function cssmodules_on_attach(_, bufnr)
  local opts = { buffer = bufnr, remap = true }

  vim.keymap.set(
    'n', 'gd', function()
      vim.lsp.buf.definition({ on_list = definition_on_list })
    end, opts
  )

  print('cssmodules attached')
end

return cssmodules_on_attach
