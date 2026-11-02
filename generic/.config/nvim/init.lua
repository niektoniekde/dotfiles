vim.g.mapleader = " "
vim.opt.mouse = ""
vim.opt.cursorline = true
vim.opt.foldtext = [[getline(v:foldstart) . ' ... ' . (v:foldend - v:foldstart + 1) . ' lines folded ']]
vim.opt.fillchars:append({ fold = ' ' })

-- generic keymaps (not related to plugins)
vim.keymap.set({ 'n', 'x' }, '<C-k>',  '<C-u>')  -- half page up
vim.keymap.set({ 'n', 'x' }, '<C-j>',  '<C-d>')  -- half page down

-- tree-sitter folding where a parser exists; markers in modelines still override
if vim.fn.has('nvim-0.10') == 1 then
  vim.treesitter.language.register('yaml', 'yaml.ansible')
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('ts_setup', { clear = true }),
    callback = function(ev)
      if not pcall(vim.treesitter.start, ev.buf) then return end
      vim.opt_local.foldmethod = 'expr'
      vim.opt_local.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'
      vim.opt_local.foldlevel  = 99
    end,
  })
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
  local ok, err = pcall(dofile, config_local)
  if not ok then vim.notify("local.lua: " .. err, vim.log.levels.ERROR) end
end
