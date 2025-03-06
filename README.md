# Introduction

My neovim config for Ruby on Rails development.

# Installation

Backup your current config:
```
mv ~/.config/nvim ~/.config/nvim-backup
```
Clone this repo and start neovim
```
git clone https://github.com/hoangnghiem/nvim-config.git ~/.config/nvim
```

# Key mappings

| mapping | description |
| ------------- | -------------- |
| \<leader\>r | Open Rails which-key mappings  |
| ,rc | Copy current ruby class name  |
| ,w | Open window hydra for quickly moving between split windows  |
| ,, | Open buffer hydra for quickly moving between buffers  |
| \<leader\>tu  | Toggle Rspec file  |

Check lua/config/keymaps.lua for more key bindings.
