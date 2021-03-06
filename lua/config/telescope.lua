local map = vim.api.nvim_set_keymap

map('n', '<leader>p', ':Telescope find_files<CR>', {noremap = true})
map('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<leader>dl', ':Telescope diagnostics<CR>', {noremap = true})
map('n', '<leader>h', ':Telescope help_tags<CR>', {noremap = true})
