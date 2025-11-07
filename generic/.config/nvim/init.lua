vim.g.mapleader = " "
vim.opt.mouse = ""

if not package.loaded['neotree'] ~= nill then
  vim.g.loaded_netrw=1
  vim.g.loaded_netrwPlugin=1
  vim.api.nvim_set_keymap('n', '<leader>E', ':Neotree position=float source=last reveal_force_cwd=true<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>F', ':Neotree position=float source=filesystem reveal_force_cwd=true<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>ef', ':Neotree position=float source=filesystem reveal_force_cwd=true<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>eb', ':Neotree position=float source=buffers reveal_force_cwd=true<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>eg', ':Neotree position=float source=git_status reveal_force_cwd=true<CR>', { noremap = true})
else
  if not package.loaded['netrw'] ~= nill then
    vim.g.netrw_liststyle = 4
    vim.api.nvim_set_keymap('n', '<leader>F', ':Ex %:p:h<CR>', { noremap = true})
  end
end

if not package.loaded['telescope'] ~= nill then
  vim.api.nvim_set_keymap('n', '<leader>B', ':Telescope buffers<CR>', { noremap = true})
else
  vim.api.nvim_set_keymap('n', '<leader>B', ':buffers<CR>', { noremap = true})
end

if not package.loaded['fugitive'] ~= nill then
  vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add %<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true})
  vim.api.nvim_set_keymap('n', '<leader>gs', ':Git status<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true })
end

if not package.loaded['indentmini'] ~= nill then
  vim.cmd.highlight('IndentLine guifg=#2e2e3e')
  vim.cmd.highlight('IndentLineCurrent guifg=#6e6e7e')
end

vim.cmd[[
" indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" numbers
set number
set relativenumber

" folding
"set foldmethod=indent
"set foldnestmax=3

" wildmenu
set wildmenu
set wildoptions=pum
set wildcharm=<Tab>

" show status line always
set laststatus=2

nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bdb :1,.-bd<CR>
nnoremap <Leader>bda :.+,$bd<CR>
nnoremap <Leader>bdo :1,.-bd\|.+,$bd<CR>

cnoremap <expr> <Up>    pumvisible() ? "\<Left>"  : "\<Up>"
cnoremap <expr> <Down>  pumvisible() ? "\<Right>" : "\<Down>"
cnoremap <expr> <Left>  pumvisible() ? "\<Up>"    : "\<Left>"
cnoremap <expr> <Right> pumvisible() ? "\<Down>"  : "\<Right>"

" append new line without leaving normal mode
nnoremap <silent> <Leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <Leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
]]

local config_local = vim.fn.expand("~/.local/etc/nvim/local.lua")
if vim.fn.filereadable(config_local) == 1 then
    dofile(config_local)
end
