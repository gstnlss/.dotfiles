local definition_on_list = require 'gstnlss.lsp.typescript.definition_on_list'

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set(
    'n', 'gd', function()
      vim.lsp.buf.definition({ on_list = definition_on_list })
    end, opts
  )

  vim.keymap.set(
    'n', '<leader>ti', function()
      vim.cmd [[TSToolsAddMissingImports]]
    end, opts
  );

  vim.keymap.set(
    'n', '<leader>tr', function()
      vim.cmd [[TSToolsRemoveUnused]]
    end, opts
  )

  vim.keymap.set(
    'n', '<leader>to', function()
      vim.cmd [[TSToolsOrganizeImports]]
    end, opts
  )
end

return on_attach
