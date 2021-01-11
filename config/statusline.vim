" statusline.vim
"

let g:airline_powerline_fonts = 1
let g:airline_theme='palenight'
" let g:airline#extensions#tabline#enabled = 1

" Get syntax highlighting item
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return 'LSP'
  endif
  return ''
endfunction

function TreeSitter() abort
  return luaeval("require('nvim-treesitter').statusline() or ''")
endfunction

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

call airline#parts#define_function('linter', 'LinterStatus')
call airline#parts#define_minwidth('linter', 50)

call airline#parts#define_function('lsp', 'LspStatus')
call airline#parts#define_minwidth('lsp', 50)

call airline#parts#define_function('syntax', 'SyntaxItem')
call airline#parts#define_minwidth('syntax', 100)


let g:airline_section_x = airline#section#create_right(['filetype' ,'syntax', 'linter','lsp'])

" set statusline=%{LinterStatus()}

" set laststatus=2
" set statusline=
" set statusline+=%f
" set statusline+=%m
" set statusline+=\ %{FugitiveStatusline()}
" set statusline+=\ %{LspStatus()}
" " set statusline+=\ %{gutentags#statusline()}
" set statusline+=%=
" " set statusline+=%{TreeSitter()}
" set statusline+=\ %{SyntaxItem()}
" set statusline+=\ %y
