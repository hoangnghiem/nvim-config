" appearance.vim
" Settings styling vim
"
" let g:oceanic_bold = 1
" let g:oceanic_italic_comments = 1
" colorscheme oceanicnext
" let g:gruvbox_bold = 1
" let g:gruvbox_italic = 1
" let g:gruvbox_underline = 1
" let g:gruvbox_italicize_comments = 1
" colorscheme gruvbox

" let g:nord_cursor_line_number_background = 1
" let g:nord_bold_vertical_split_line = 1
" let g:nord_uniform_diff_background = 1
" let g:nord_italic = 1
" let g:nord_bold = 0
" let g:nord_italic_comments = 1
" let g:nord_underline = 1

" augroup nord-theme-overrides
"   autocmd!
"   " Use 'nord7' as foreground color for Vim comment titles.
"   " autocmd ColorScheme nord highlight Normal guibg=3=#2e3440 ctermfg=grey ctermbg=darkblue
"   autocmd ColorScheme nord highlight Normal guibg=#2a2f3a ctermfg=grey ctermbg=darkblue
" augroup END

" colorscheme nord

" Color Scheme
" colorscheme quantum
" let g:quantum_italics=1

" let g:oceanic_next_terminal_bold = 0
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext

let g:palenight_terminal_italics=1
colorscheme palenight

" let g:one_allow_italics = 1
" colorscheme one

" Use true colors
set termguicolors

" don't syntax-highlight long lines
" set synmaxcol=200

" Show whitespace
set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·,space:·

" Highlight the column after 'textwidth'
set colorcolumn=+1

" Set program title to 'nvim'
set title
setglobal titlestring=nvim

" Show line numbers
set number

" Highlight the current line, don't highlight the current column
set cursorline
set nocursorcolumn

" Always draw gutter for gitgutter, signify, etc.
set signcolumn=yes

" Don't redraw for macros
set lazyredraw

" Code Folding
" See https://github.com/w0rp/ale/issues/1829
" Don't set foldmethod=syntax
set foldlevelstart=99

" Show clipboards and macros
" let g:peekaboo_delay = 500
" let g:peekaboo_compact = 1

" Colorize
if has('nvim')
  packadd nvim-colorizer.lua
  lua require 'colorizer'.setup(nil, { css = true; })
endif

augroup windows
  autocmd!
  " Evenly resize windows on terminal screen change.
  autocmd VimResized * :wincmd =
  " Split help windows vertically, on the right.
  autocmd FileType help wincmd L
augroup END

" Reset the cursor on exit
" See https://github.com/neovim/neovim/issues/4867#issuecomment-291249173
" and https://github.com/neovim/neovim/wiki/FAQ#cursor-style-isnt-restored-after-exiting-nvim
" set guicursor=a:blinkon100
augroup cursor
  autocmd!
  autocmd VimLeave,VimSuspend * set guicursor=a:ver25-blinkon1
augroup END
