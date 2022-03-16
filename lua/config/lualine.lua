
require'lualine'.setup {
    options = {
        theme = 'gruvbox'
    },
    sections = {
        lualine_x = {'encoding'},
        lualine_y = {},
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
