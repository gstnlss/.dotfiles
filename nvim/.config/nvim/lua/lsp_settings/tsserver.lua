local lspconfig = require('lspconfig')
local lsp_settings_utils = require('lsp_settings.utils')
local on_attach = lsp_settings_utils.on_attach
local capabilities = lsp_settings_utils.capabilities

lspconfig.tsserver.setup(
  {
    on_attach = function(client, bufnr)
      on_attach.lsp_keymaps(client, bufnr)
      on_attach.highlight(client, bufnr)
      on_attach.disable_formatting(client)
    end,
    capabilities = capabilities,
    init_options = { preferences = { disableSuggestions = true } },
    handlers = {
      -- Patch to solve goto definition in React opening quickfix:
      --   - https://github.com/neovim/neovim/issues/14556
      --   - https://github.com/typescript-language-server/typescript-language-server/issues/216
      --   - https://github.com/microsoft/TypeScript/issues/37816
      -- Specifically borrowed the below code from:
      --   - https://github.com/typescript-language-server/typescript-language-server/issues/216#issuecomment-939369240
      ['textDocument/definition'] = function(_, results, params)
        if results == nil or vim.tbl_isempty(results) then
          local _ = vim.lsp.log.info() and
                      vim.lsp.log.info(params.method, 'No location found')
          return nil
        end

        -- https://github.com/hrsh7th/nvim-cmp/issues/726#issuecomment-1012213386
        local client_id = params.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local offset_encoding = client.offset_encoding or 'utf-16'

        if vim.tbl_islist(results) then
          vim.lsp.util.jump_to_location(results[1], offset_encoding)
          if #results > 1 then
            local isReactDTs = false

            for _, result in pairs(results) do
              if string.match(result.uri, 'react/index.d.ts') then
                isReactDTs = true
                break
              end
            end

            if not isReactDTs then
              vim.lsp.util.set_qflist(vim.lsp.util.locations_to_items(results))
              vim.api.nvim_command('copen')
              vim.api.nvim_command('wincmd p')
            end
          end
        else
          vim.lsp.util.jump_to_location(results, offset_encoding)
        end
      end
    }
  }
)
