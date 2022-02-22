local opts = {noremap = true}
local map = vim.api.nvim_set_keymap

require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

map('n', '<c-a>', ':ToggleTermToggleAll<CR>', opts)
map('t', '<c-a>', ':ToggleTermToggleAll<CR>', opts)

function _G.set_terminal_keymaps()
    local mapbuf = vim.api.nvim_buf_set_keymap

    mapbuf(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    mapbuf(0, 't', '<C-a>', [[<C-\><C-n>:ToggleTermToggleAll<CR>]], opts)
    mapbuf(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    mapbuf(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    mapbuf(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    mapbuf(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')