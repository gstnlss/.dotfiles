require('bufferline').setup(
  {
    options = {
      show_buffer_close_icons = false,
      diagnostics = 'nvim_lsp',
      offsets = {
        { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' }
      }
    }
  }
)

vim.keymap.set('n', '<C-p>', ':BufferLineCyclePrev<CR>', { noremap = true })
vim.keymap.set('n', '<C-n>', ':BufferLineCycleNext<CR>', { noremap = true })

