  return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "bash", "c", "helm", "lua", "vim", "vimdoc", "query", "yaml" },
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  }
