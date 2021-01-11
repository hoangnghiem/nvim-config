" editing.vim
" Settings involving editing files

" Map leader to space
let mapleader = ' '

" Disable swapfiles
set noswapfile

" Use system clipboard
set clipboard+=unnamedplus

" Whitespace characters settings
" refs:
" - http://vimcasts.org/episodes/tabs-and-spaces/
" - http://vimcasts.org/episodes/show-invisibles/
" View tabs as 2 spaces wide
set tabstop=2
" Ident by 2:
set shiftwidth=2
" Use spaces instead of tabs
set expandtab
" Tab to the current indent level
set smarttab
" Autoindent new lines
set autoindent

" Spell checking
" refs:
" - http://vimcasts.org/episodes/spell-checking/
" Spell file location
set spellfile=~/.config/nvim/spell/dictionary.utf-8.add
" 'Murican English
set spelllang=en_us
" No spelling by default
" Toggable by keyboard settings in unimpaired
" [os to enable
" ]os to disable
" =os to toggle
set nospell

" Searching
" Case insensitive by default, case sensitive with an uppercase char
set ignorecase
set smartcase
" Clear search buffer on return
nnoremap <silent> <CR> :nohlsearch<CR>
" Search selection is visual mode

"" Replacing
set inccommand=nosplit
"" Vim's substitute command is not interactive.

" make Y consistent with C and D.
nnoremap Y y$

" Let's call it PascalCase, not MixedCase
nmap crp crm
" Also kebabcase
nmap cr- crk

" Change definition of word
let g:wordmotion_spaces = ''

augroup editing
  " Highlight yanks
  au TextYankPost * silent! lua vim.highlight.on_yank {timeout=1000}
augroup END

augroup external
  " Open images in an image viewer (probably Preview)
  autocmd BufEnter *.png,*.jpg,*.gif exec "silent !open ".expand("%") | :bw
augroup END

" ================================================
" Windows / Buffers
" ================================================
" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" <ctrl + h/j/k/l> moving windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-l> <C-w>l

" Kill current buffer
map ,w :BD<cr>

" Exit
map ,q :q<cr>

" Better completion nav
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

" ================================================
" Search
" ================================================
" Type // to search selected text
vnoremap // y/<C-R>"<CR>
" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

nmap <F2> :retab <CR> :w<CR>
imap <F2> <ESC>:retab <CR> :w<CR>

nmap <F3> :TagbarToggle<CR>

" ================================================
" F12 for re-sync syntax when lost
" ================================================
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" CamelMotion
map W <Plug>CamelCaseMotion_w
map B <Plug>CamelCaseMotion_b
map E <Plug>CamelCaseMotion_e

" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" sort import on save
let g:import_sort_auto = 1
