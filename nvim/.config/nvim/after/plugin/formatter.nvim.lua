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
    -- rust
    rust = { filetypes.rust.rustfmt },
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
  'FormatterNvimOnSave', { clear = true }
);
vim.api.nvim_create_autocmd(
  'BufWritePost', {
    group = format_on_save_augroup,
    callback = function()
      vim.cmd('FormatWrite')
      vim.cmd('GitGutterBufferEnable') -- Gutter was not updating correctly
    end
  }
)
