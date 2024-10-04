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
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false
        }
      },
      use_libuv_file_watcher = false,
      window = {
        position = "left",
        width = 35,
        mapping_options = {
          noremap = true,
          nowait = true,
        }
      }
    })
  vim.keymap.set('n', '<Leader>t', ':Neotree reveal<CR>', {})
  vim.keymap.set('n', '<Leader>.', ':Neotree dir=./<CR>', {})
  end
}
