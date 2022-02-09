local map = vim.api.nvim_set_keymap
local let = vim.g

-- map('n', '<silent><leader>pcd', ':call PhpCsFixerFixDirectory()<CR>', {noremap = true})
-- map('n', '<silent><leader>pcf', ':call PhpCsFixerFixFile()', {noremap = true})

let.php_cs_fixer_enable_default_mapping = false

vim.cmd [[
    autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
]]
