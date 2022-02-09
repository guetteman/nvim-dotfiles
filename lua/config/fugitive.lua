local map = vim.api.nvim_set_keymap

map('n', '<leader>gg', ':Git<CR>', {noremap = true})
map('n', '<leader>ga', ':Git add<CR>', {noremap = true})
map('n', '<leader>gaa', ':Git add .<CR>', {noremap = true})
map('n', '<leader>gc', ':Git commit<CR>', {noremap = true})
map('n', '<leader>gp', ':Git push<CR>', {noremap = true})
map('n', '<leader>gbl', ':Telescope git_branches<CR>', {noremap = true})
map('n', '<leader>gst', ':Telescope git_status<CR>', {noremap = true})
