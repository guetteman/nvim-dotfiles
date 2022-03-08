local set = vim.g
local map = vim.api.nvim_buf_set_keymap
local options = { noremap = true, silent = true }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local general_keybindings = function (bufnr)
    map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
    map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
    map(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
    map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
    map(bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
    map(bufnr, 'n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)

    map(bufnr, 'n', '<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)
    map(bufnr, 'n', '<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
    map(bufnr, 'n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', options)
end

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    if server.name == "intelephense" then
        opts.on_attach = function(client, bufnr)
            general_keybindings(bufnr)

            set.tabstop = 4
            set.softtabstop = 4
            set.shiftwidth = 4
        end
    end

    if server.name == "tsserver" then
        opts.on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            general_keybindings(bufnr)

            set.tabstop = 2
            set.softtabstop = 2
            set.shiftwidth = 2
            set.smartindent = false
            set.cindent = true

            local ts_utils = require("nvim-lsp-ts-utils")
            ts_utils.setup({})
            ts_utils.setup_client(client)
        end
    end

    if server.name == "eslint" then
        opts.on_attach = function (client, bufnr)
            -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
            -- the resolved capabilities of the eslint server ourselves!
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            general_keybindings(bufnr)

            map(bufnr, 'n', '<leader>,', '<cmd>EslintFixAll<CR>', options)
        end

        opts.settings = {
            format = { enable = true }, -- this will enable formatting
        }
    end

    if server.name == "rust_analyzer" then
        opts.on_attach = function(client, bufnr)
            general_keybindings(bufnr)

            set.tabstop = 4
            set.softtabstop = 4
            set.shiftwidth = 4
            set.smartindent = false
            set.cindent = true
        end
    end
    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier
    },
    on_attach = function(client, bufnr)
        general_keybindings(bufnr)

        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end,
})

-- Setup nvim-cmp.
vim.opt.completeopt={'menu','menuone','noselect'}

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})
