
require'lualine'.setup {
    options = {
        theme = 'nord'
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
