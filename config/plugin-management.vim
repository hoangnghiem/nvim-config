" Plugins
" Package manager: vim-packager, https://github.com/kristijanhusak/vim-packager

function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('norcalli/nvim-colorizer.lua', {'type': 'opt'})
  call packager#add('airblade/vim-gitgutter')
  call packager#add('nelstrom/vim-visual-star-search')
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-unimpaired')
  call packager#add('bkad/CamelCaseMotion')
  call packager#add('simeji/winresizer')


  " Themes
  call packager#add('tyrannicaltoucan/vim-quantum')
  call packager#add('crusoexia/vim-dracula')
  call packager#add('dracula/vim')
  call packager#add('adrian5/oceanic-next-vim')
  call packager#add('mhartington/oceanic-next')
  call packager#add('romgrk/doom-one.vim')
  call packager#add('arcticicestudio/nord-vim')
  call packager#add('morhetz/gruvbox')
  call packager#add('NLKNguyen/papercolor-theme')
  call packager#add('drewtempelmeyer/palenight.vim')
  call packager#add('rakr/vim-one')

  " Substitution and Coercion
  call packager#add('tpope/vim-abolish')
  call packager#add('chaoren/vim-wordmotion')
  call packager#add('kana/vim-textobj-user')
  call packager#add('kana/vim-textobj-entire')
  call packager#add('wellle/targets.vim')


  " Git
  call packager#add('tpope/vim-fugitive')

  " Enhance netrw
  call packager#add('tpope/vim-vinegar')

  call packager#add('vim-test/vim-test')
  call packager#add('dense-analysis/ale')
  call packager#add('tpope/vim-projectionist')

  " LSP
  call packager#add('neovim/nvim-lspconfig', {'type': 'opt'})
  call packager#add('nathunsmitty/nvim-ale-diagnostic', {'type': 'opt'})
  call packager#add('steelsojka/completion-buffers', {'type': 'opt'})
  call packager#add('tjdevries/nlua.nvim', {'type': 'opt'})
  call packager#add('RishabhRD/popfix')
  call packager#add('RishabhRD/nvim-lsputils')

  " Completion
  call packager#add('hrsh7th/nvim-compe')
  call packager#add('hrsh7th/vim-vsnip')
  call packager#add('hrsh7th/vim-vsnip-integ')

  " Treesitter
  call packager#add('nvim-treesitter/nvim-treesitter', {'type': 'opt', 'do': ':TSUpdate'})
  call packager#add('nvim-treesitter/nvim-treesitter-textobjects', {'type': 'opt'})
  call packager#add('nvim-treesitter/playground', {'type': 'opt'})

  call packager#add('mhinz/vim-startify')


  " File explorer
  call packager#add('kyazdani42/nvim-web-devicons')
  call packager#add('kyazdani42/nvim-tree.lua')
  " call packager#add('neoclide/coc.nvim', { 'branch': 'release' })

  call packager#add('nvim-lua/popup.nvim')
  call packager#add('nvim-lua/plenary.nvim')
  call packager#add('nvim-telescope/telescope.nvim')

  " Search
  call packager#add('srstevenson/vim-picker')
  " call packager#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
  " call packager#add('junegunn/fzf.vim')
  " call packager#add('fszymanski/fzf-quickfix', {'on': 'Quickfix'})
  call packager#add('eugen0329/vim-esearch')

  " Auto pair
  call packager#add('tmsvg/pear-tree')

  " Tagbar
  call packager#add('majutsushi/tagbar')

  " Tabline
  call packager#add('akinsho/nvim-bufferline.lua')

  " Sort import
  call packager#add('ruanyl/vim-sort-imports')

  " Status line
  call packager#add('vim-airline/vim-airline')
  call packager#add('vim-airline/vim-airline-themes')
  " call packager#add('hoob3rt/lualine.nvim')
  " call packager#add('ryanoasis/vim-devicons')

  " Buffers
  call packager#add('qpkorr/vim-bufkill')
  call packager#add('vim-scripts/BufOnly.vim')

  " CSS, Less, Sass
  " call packager#add('cakebaker/scss-syntax.vim')
  " call packager#add('groenewege/vim-less')
  " " JavaScript
  " call packager#add('pangloss/vim-javascript')
  " call packager#add('styled-components/vim-styled-components', {'branch': 'main'})
  " call packager#add('maxmellon/vim-jsx-pretty')
  " " TypeScript
  " call packager#add('HerringtonDarkholme/yats.vim')
  " call packager#add('mhartington/nvim-typescript', {'build': './install.sh'})

  " " JSON
  " call packager#add('elzr/vim-json')
  " " GraphQL
  call packager#add('jparise/vim-graphql')
  " " Ruby
  " call packager#add('vim-ruby/vim-ruby')
  " Ruby on Rails
  call packager#add('tpope/vim-rails')
  call packager#add('tpope/vim-endwise')
  call packager#add('tpope/vim-rake')
  call packager#add('tpope/vim-bundler')

  " Navigate betweens vim and tmux panes
  call packager#add('christoomey/vim-tmux-navigator')
  call packager#add('tpope/vim-obsession')

  call packager#add('thoughtbot/vim-rspec')
  call packager#add('jgdavey/tslime.vim')

  " Emmet
  call packager#add('mattn/emmet-vim')

  " Multi cursors
  call packager#add('mg979/vim-visual-multi')

endfunction


command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()
