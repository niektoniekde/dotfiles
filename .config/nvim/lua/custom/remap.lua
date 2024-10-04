vim.cmd[[
" normal mode - non-recursive - remaps
"nnoremap <Leader>b :buffer<Space><Tab>
"nnoremap <Leader>B :buffers<CR>:buffer<Space>
"nnoremap <Leader>t :NvimTreeToggle<CR>

cnoremap <expr> <Up>    pumvisible() ? "\<Left>"  : "\<Up>"
cnoremap <expr> <Down>  pumvisible() ? "\<Right>" : "\<Down>"
cnoremap <expr> <Left>  pumvisible() ? "\<Up>"    : "\<Left>"
cnoremap <expr> <Right> pumvisible() ? "\<Down>"  : "\<Right>"

" delete all buffers except current one
nnoremap <Leader>xo :1,.-bd\|.+,$bd<CR>
nnoremap <Leader>xb :1,.-bd<CR>
nnoremap <Leader>xa :.+,$bd<CR>
" delete current buffer
nnoremap <Leader>xc :bd<CR>
]]
