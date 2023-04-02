local typescript = require 'typescript';
local filter_react_dts = require 'gstnlss.lsp.typescript.filter_react_dts'

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set(
    'n', 'gd', function()
      vim.lsp.buf.definition({ on_list = filter_react_dts })
    end, opts
  )

  vim.keymap.set(
    'n', '<leader>ti', function()
      typescript.actions.addMissingImports()
    end, opts
  );

  vim.keymap.set(
    'n', '<leader>tr', function()
      typescript.actions.removeUnused()
    end, opts
  )

  vim.keymap.set(
    'n', '<leader>to', function()
      typescript.actions.organizeImports()
    end, opts
  )
end

return on_attach
