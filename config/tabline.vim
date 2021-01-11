" noremap <leader>tn :bn<CR>
" noremap <leader>tp :bp<CR>
" noremap <leader>td :Bw!<CR>
" noremap <leader>tt :tabnew split<CR>

" let g:buffet_powerline_separators = 1
" let g:buffet_show_index = 1
" let g:buffet_use_devicons = 1

lua require'bufferline'.setup()
nnoremap <silent>b] :BufferLineCycleNext<CR>
nnoremap <silent>b[ :BufferLineCyclePrev<CR>
