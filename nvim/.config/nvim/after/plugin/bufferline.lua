require('bufferline').setup(
    {
        options = {
            show_buffer_close_icons = false,
            diagnostics = 'nvim_lsp',
            separator_style = 'thin',
            show_tab_indicators = true,
            offsets = { { filetype = 'NvimTree', text = 'File explorer', padding = 1 } }
        }
    }
)

vim.keymap.set('n', '<C-p>', vim.cmd.BufferLineCyclePrev, { noremap = true })
vim.keymap.set('n', '<C-n>', vim.cmd.BufferLineCycleNext, { noremap = true })
