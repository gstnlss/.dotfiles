require('plugins')
require('options')

vim.api.nvim_set_var('python_host_prog', '/usr/bin/python2')
vim.api.nvim_set_var('python3_host_prog', '/usr/bin/python3')
vim.api.nvim_set_var('node_host_prog', '/usr/bin/neovim-node-host')

vim.api.nvim_set_var('NERDTreeGitStatusUseNerdFonts', 1)

-- " vim-airline
vim.api.nvim_set_var('airline_theme', 'gruvbox')
vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1);

require('nvim-autopairs').setup {
  disable_filetype = { 'TelescopePrompt', 'vim' },
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' }
  })
})
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { text = '' } }))

require('lsp_settings')
require('keymaps')

require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}

require 'telescope'.setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      height = 0.95,
      prompt_position = 'top',
      preview_height = 0.7,
      mirror = true
    }
  },
}

-- Change border of documentation hover window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
