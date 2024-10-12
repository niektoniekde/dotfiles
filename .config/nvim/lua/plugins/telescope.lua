return  {
  'nvim-telescope/telescope.nvim',
  dependencies = {'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>f', builtin.find_files, {})
    vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})

    require('telescope').setup({
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
  end
}

