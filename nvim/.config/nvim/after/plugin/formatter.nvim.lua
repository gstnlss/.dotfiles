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

local clients_with_formatter = {
  lua_ls = true,
  tsserver = true,
  rust_analyzer = true
}
local format_file = function()
  local clients = vim.lsp.buf_get_clients()
  local has_formatter = false

  for _, client in pairs(clients) do
    if clients_with_formatter[client.name] then
      has_formatter = true
    end
  end

  if has_formatter then
    vim.cmd('FormatWrite')
  else
    vim.lsp.buf.format()
  end
end

vim.keymap.set('n', '<leader>f', format_file)

local format_on_save_augroup = vim.api.nvim_create_augroup(
  'FormatterNvimOnSave', { clear = true }
);
vim.api.nvim_create_autocmd(
  'BufWritePost', {
    group = format_on_save_augroup,
    callback = function()
      format_file()
      vim.cmd('GitGutterBufferEnable') -- Gutter was not updating correctly
    end
  }
)
