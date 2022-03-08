local let = vim.g

require'nvim-tree'.setup {
  auto_close = true,
  disable_netwr = true,
  view = {
    width = 50,
    side = 'right',
    auto_resize = true,
  },
  actions = {
      open_file = {
          quit_on_open = true
      }
  }
}

-- vim.api.nvim_set_keymap('n', '<leader>b', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>b', ':NvimTreeFindFileToggle<CR>', {noremap = true})
