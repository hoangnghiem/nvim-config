" Plugins manager
source $HOME/.config/nvim/config/plugin-management.vim
" source $HOME/.config/nvim/plugins.vim

" Mostly vanilla Vim style tweaks
source $HOME/.config/nvim/config/appearance.vim
source $HOME/.config/nvim/config/navigation.vim
source $HOME/.config/nvim/config/editing.vim
source $HOME/.config/nvim/config/statusline.vim
source $HOME/.config/nvim/config/telescope.vim

" Various feature extensions
source $HOME/.config/nvim/config/integrations.vim
source $HOME/.config/nvim/config/linting.vim
source $HOME/.config/nvim/config/searching.vim
source $HOME/.config/nvim/config/completion.vim
source $HOME/.config/nvim/config/file-explorer.vim
source $HOME/.config/nvim/config/testing.vim
source $HOME/.config/nvim/config/tabline.vim

" Beta features
if has('nvim-0.5')
  source $HOME/.config/nvim/config/lsp.vim
  source $HOME/.config/nvim/config/treesitter.vim
end
