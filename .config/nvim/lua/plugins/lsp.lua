return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "yamlls"
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({ capabilities = capabilities })
          end,
          ["helm_ls"] = function ()
            local lspconfig = require("lspconfig")
            lspconfig.helm_ls.setup {
            settings = {
              ['helm-ls'] = {
                yamlls = {
                  enabled = true,
                  path = "yaml-language-server"
                }
              }
            }
          }
          end
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
    end
  }
}
