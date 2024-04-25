require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    enable = true,
    git_ignored = false,
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    no_bookmark = false,
    custom = {},
    exclude = {},
  },
})

