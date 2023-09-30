local neotest = require('neotest')
neotest.setup({
    adapters = {
        require('neotest-vitest')
    }
})

vim.keymap.set('n', '<leader>tr', neotest.run.run, {})
vim.keymap.set('n', '<leader>tf', function()
    neotest.run.run(vim.fn.expand("%"))
end)
