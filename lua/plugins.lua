vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function ()
    use 'wbthomason/packer.nvim'

    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use 'saadparwaiz1/cmp_luasnip'
    use "jose-elias-alvarez/null-ls.nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }

    use 'morhetz/gruvbox'
    


    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    } 

    use {
        'ThePrimeagen/harpoon',
        requires = { {'nvim-lua/plenary.nvim'} }
    } 

    use 'jiangmiao/auto-pairs'

    use 'alvan/vim-closetag'

    use 'tpope/vim-commentary'

    use 'editorconfig/editorconfig-vim' 

    use 'tpope/vim-fugitive'

    use 'vim-test/vim-test'

    use 'stephpy/vim-php-cs-fixer'

    use 'glepnir/dashboard-nvim'

    use 'christoomey/vim-tmux-navigator'

    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    }

    use { "beauwilliams/focus.nvim", config = function() require("focus").setup({
        excluded_filetypes = {"harpoon", "nvimtree"},
        compatible_filetrees = {"nvimtree"}
    }) end }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)
