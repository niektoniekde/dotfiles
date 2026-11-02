if package.loaded['neo-tree'] then
  vim.api.nvim_set_keymap('n', '<leader>E', ':Neotree position=float source=last reveal_force_cwd=true<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>F', ':Neotree position=float source=filesystem reveal_force_cwd=true<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>ef', ':Neotree position=float source=filesystem reveal_force_cwd=true<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>eb', ':Neotree position=float source=buffers reveal_force_cwd=true<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>eg', ':Neotree position=float source=git_status reveal_force_cwd=true<CR>', { noremap = true})
else
  vim.g.netrw_liststyle = 4
  vim.api.nvim_set_keymap('n', '<leader>F', ':Ex %:p:h<CR>', { noremap = true})
end

if package.loaded['telescope'] then
  vim.api.nvim_set_keymap('n', '<leader>tb', ':Telescope buffers<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader><tab>', ':Telescope buffers<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>`', ':Telescope lsp_document_symbols<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tg', ':Telescope live_grep<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>tf', ':Telescope find_files<CR>', { noremap = true})
else
  vim.api.nvim_set_keymap('n', '<leader>B', ':buffers<CR>', { noremap = true})
end

if package.loaded['indentmini'] then
  vim.cmd.highlight('IndentLine guifg=#2e2e3e')
  vim.cmd.highlight('IndentLineCurrent guifg=#6e6e7e')
end

if vim.g.loaded_fugitive then
  vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add %<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>gs', ':Git status<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true })
end

