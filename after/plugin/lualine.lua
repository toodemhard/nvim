local custom_gruvbox = require 'lualine.themes.gruvbox'

-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.a.bg = '#83a598'
custom_gruvbox.normal.c.bg = '#282828'
custom_gruvbox.normal.b.bg = '#3c3836'
custom_gruvbox.normal.c.fg = '#ebdbb2'


custom_gruvbox.insert.a.bg = '#b8bb26'
custom_gruvbox.insert.c.bg = '#282828'
custom_gruvbox.insert.b.bg = '#3c3836'

custom_gruvbox.visual.a.bg = '#fabd2f'
custom_gruvbox.visual.c.bg = '#282828'
custom_gruvbox.visual.b.bg = '#3c3836'
custom_gruvbox.visual.c.fg = '#ebdbb2'

custom_gruvbox.command.a.bg = '#8ec07c'
custom_gruvbox.command.c.bg = '#282828'
custom_gruvbox.command.b.bg = '#3c3836'
custom_gruvbox.command.c.fg = '#ebdbb2'

custom_gruvbox.replace.b.bg = '#3c3836'

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },

        -- component_separators = '',
        -- section_separators = '',
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        -- globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,

        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
