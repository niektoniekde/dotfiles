return {
  "nvim-lualine/lualine.nvim",

  config = function()
    require('lualine').setup({
      options = {
        theme = 'catppuccin',
        globalstatus = true,
        disabled_filetypes = {
            'NvimTree',
            'neo-tree',
            'packer',
            'undotree',
            'diffpanel_3',
            statusline={},
            winbar={}
        },
        ignore_focus = {
            'NvimTree',
            'neo-tree',
            'packer',
            'undotree',
            'diffpanel_3',
            statusline={},
            winbar={}
        }
      }
    })
  end
}
