local null_ls = require('null-ls')

local sources = {
    null_ls.builtins.formatting.prettier
}

null_ls.setup({sources = sources})

vim.keymap.set('n', '<leader>f', function ()
    vim.lsp.buf.format()
end)
