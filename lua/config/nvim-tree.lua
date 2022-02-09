local let = vim.g

let.nvim_tree_quit_on_open = 1

require'nvim-tree'.setup {
  auto_close = true,
  view = {
    width = 50,
    side = 'right',
    auto_resize = true,
  }
}

vim.api.nvim_set_keymap('n', '<leader>b', ':NvimTreeToggle<CR>', {noremap = true})
