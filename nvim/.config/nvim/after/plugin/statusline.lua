require('lualine').setup(
  {
    options = { disabled_filetypes = { statusline = { 'NvimTree', 'alpha' } } },
    sections = {
      lualine_c = {
        'filename',
        {
          function()
            local msg = 'No Active LSP'
            local clients = vim.lsp.get_active_clients({ bufnr = 0 })

            if next(clients) == nil then
              return msg
            end

            local lsp_list = {}
            local lsp_count = 0

            for _, client in ipairs(clients) do
              table.insert(lsp_list, client.name)
              lsp_count = lsp_count + 1
            end

            if lsp_count > 0 then
              return tostring(table.concat(lsp_list, ', '))
            end

            return msg
          end,
          icon = '[LSP]:'
        }
      }
    }
  }
)

