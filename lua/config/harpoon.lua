local map = vim.api.nvim_set_keymap

map('n', '<leader>fm', ':lua require("harpoon.mark").add_file()<CR>', {noremap = true})
map('n', '<leader>fj', ':lua require("harpoon.ui").nav_file(1)<CR>', {noremap = true})
map('n', '<leader>fk', ':lua require("harpoon.ui").nav_file(2)<CR>', {noremap = true})
map('n', '<leader>fl', ':lua require("harpoon.ui").nav_file(3)<CR>', {noremap = true})
map('n', '<leader>f;', ':lua require("harpoon.ui").nav_file(4)<CR>', {noremap = true})
map('n', '<leader>fh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {noremap = true})
map('n', '<leader>ft', ':lua require("harpoon.term").gotoTerminal(1)<CR>', {noremap = true})
