require('lualine').setup {
  options = {
    theme = 'solarized',
    globalstatus = true,
    disabled_filetypes = {
        'NvimTree',
        'packer',
        'undotree',
        'diffpanel_3',
        statusline={},
        winbar={}
    },
    ignore_focus = {
        'NvimTree',
        'packer',
        'undotree',
        'diffpanel_3',
        statusline={},
        winbar={}
    }
  }
}
