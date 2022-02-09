"---------------------------------------------------------
" General Settings
"---------------------------------------------------------

lua require('basic')

"---------------------------------------------------------
" Plugins
"--------------------------------------------------------

lua require('plugins')

lua require('config.lsp-config')

lua require('config.nvim-tree')

lua require('config.nord')

lua require('config.telescope')

lua require('config.harpoon')

lua require('config.fugitive')

lua require('config.lualine')

lua require('config.closetag')

lua require('config.vim-test')

lua require('config.php-cs-fixer')

lua require('config.ultisnips')

"---------------------------------------------------------
" Keybindings
"--------------------------------------------------------

" New line
nmap <leader>j o<Esc>
nmap <leader>k O<Esc>

" Duplicate line
nmap <leader>dd yyp

" Indentation
nmap { V<
nmap } V>

" Close buffer
nmap <leader>wq <cmd>bw<CR>
