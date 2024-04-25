local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({details = true})

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
  },
  --- (Optional) Show source name in completion menu
  formatting = cmp_format,
})
