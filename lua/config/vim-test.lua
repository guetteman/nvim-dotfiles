local map = vim.api.nvim_set_keymap
local let = vim.g

map('n', '<leader>t', ':TestNearest<CR>', {})
map('n', '<leader>T', ':TestFile<CR>', {})
map('n', '<leader>a', ':TestSuite<CR>', {})
map('n', '<leader>l', ':TestLast<CR>', {})
map('n', '<leader>g', ':TestVisit<CR>', {})

let['test#strategy'] = 'neovim'
let['test#php#phpunit#executable'] = 'vendor/bin/phpunit'
let['test#neovim#start_normal'] = 1
