return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("neo-tree").setup({
      enable_git_status = true,
      close_if_last_window = true,
      popup_border_style = "rounded",
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false
        }
      },
      use_libuv_file_watcher = true,
      window = {
        position = "float",
        mapping_options = {
          noremap = true,
          nowait = true,
        }
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        show_unloaded = true,
      },
    })
  vim.keymap.set('n', '<Leader>t', ':Neotree source=last reveal=true<CR>', {})
  end
}
