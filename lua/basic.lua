local set = vim.opt
local let = vim.g

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

set.relativenumber = true
set.nu = true
set.hlsearch = false
set.hidden = true
set.errorbells = false
set.wrap = false

set.smartcase = true
set.ignorecase = true

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME")..'/.vim/undodir'
set.undofile = true

set.incsearch = true
set.termguicolors = true
set.cursorline = true
set.scrolloff = 8
set.showmode = false
set.completeopt = 'menuone,noselect'

set.wildmode = 'longest:full,full'

set.signcolumn = 'yes'
set.colorcolumn = '80'

set.splitbelow = true
set.splitright = true

set.clipboard = 'unnamedplus'

let.mapleader = " "
