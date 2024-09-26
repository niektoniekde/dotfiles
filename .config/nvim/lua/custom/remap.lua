vim.cmd[[
" normal mode - non-recursive - remaps
"nnoremap <Leader>b :buffer<Space><Tab>
"nnoremap <Leader>B :buffers<CR>:buffer<Space>
"nnoremap <Leader>t :NvimTreeToggle<CR>

cnoremap <expr> <Up>    pumvisible() ? "\<Left>"  : "\<Up>"
cnoremap <expr> <Down>  pumvisible() ? "\<Right>" : "\<Down>"
cnoremap <expr> <Left>  pumvisible() ? "\<Up>"    : "\<Left>"
cnoremap <expr> <Right> pumvisible() ? "\<Down>"  : "\<Right>"
]]
