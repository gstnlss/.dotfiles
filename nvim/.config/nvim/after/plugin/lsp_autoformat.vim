autocmd BufWritePre *.lua,*.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.formatting_seq_sync({}, 2500)
