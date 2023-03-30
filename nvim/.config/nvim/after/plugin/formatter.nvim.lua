local formatter = require 'formatter'
local filetypes = require 'formatter.filetypes'

formatter.setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    -- lua
    lua = { filetypes.lua.luaformat },
    -- js/ts
    javascript = { filetypes.javascript.prettierd },
    javascriptreact = { filetypes.javascriptreact.prettierd },
    typescript = { filetypes.typescript.prettierd },
    typescriptreact = { filetypes.typescriptreact.prettierd },
    -- dotnet
    cs = { filetypes.cs.dotnetformat },
    -- all
    ['*'] = { filetypes.any.remove_trailing_whitespace }
  }
}

vim.keymap.set(
  'n', '<leader>f', function()
    vim.cmd('Format')
  end
)
vim.keymap.set(
  'n', '<leader>F', function()
    vim.cmd('FormatWrite')
  end
)

local format_on_save_augroup = vim.api.nvim_create_augroup(
  'LspFormatOnSave', { clear = true }
);
vim.api.nvim_create_autocmd(
  'BufWritePost', {
    group = format_on_save_augroup,
    pattern = { '*' },
    callback = function()
      vim.lsp.buf.format()
      vim.cmd('FormatWrite')
    end
  }
)
