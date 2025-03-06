-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- map("n", "q", "<Nop>", { silent = true, noremap = true })

-- Buffer navigation
map("n", "gl", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "gh", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Ctrl-Shift-j to duplicate the current line
map("n", "<C-S-j>", "yyp", { desc = "Yank line" })

-- Ctrl-shift-k to delete the current line
map("n", "<C-S-k>", "dd", { desc = "Delete line" })

map("n", "<tab>", "za", { desc = "Toggle fold" })

map("n", "<Leader>fo", "<cmd>Neotree reveal<cr>", { desc = "Reveal file" })

map("n", "<Leader>rm", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/app/models" })
end, { noremap = true, silent = true, desc = "models" })

map("n", "<Leader>rn", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/db" })
end, { noremap = true, silent = true, desc = "migrations" })

map("n", "<Leader>rc", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/app/controllers" })
end, { noremap = true, silent = true, desc = "controllers" })

map("n", "<Leader>rv", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/app/views" })
end, { noremap = true, silent = true, desc = "views" })

map("n", "<Leader>ry", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/app/views/layouts" })
end, { noremap = true, silent = true, desc = "layouts" })

map("n", "<Leader>rp", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/app/components" })
end, { noremap = true, silent = true, desc = "components" })

map("n", "<Leader>ro", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/app/previews" })
end, { noremap = true, silent = true, desc = "previews" })

map("n", "<Leader>ri", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/config" })
end, { noremap = true, silent = true, desc = "config" })

map("n", "<Leader>rs", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/app/services" })
end, { noremap = true, silent = true, desc = "services" })

map("n", "<Leader>rj", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd(), pattern = ".js" })
end, { noremap = true, silent = true, desc = "javascripts" })

map("n", "<Leader>rt", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd(), pattern = ".css" })
end, { noremap = true, silent = true, desc = "stylesheets" })

map("n", "<Leader>rh", function()
  Snacks.picker.files({ cwd = vim.fn.getcwd() .. "/app/helpers" })
end, { noremap = true, silent = true, desc = "helpers" })

map("n", "<Leader>tu", function()
  require("rails.init").toggle_rspec()
end, { noremap = true, silent = true, desc = "Toggle Rspec" })

map("n", ",rc", function()
  require("rails.init").copy_fully_qualified_class_name()
end, { noremap = true, silent = true, desc = "Copy class name" })

map("n", "<Leader>f.", function()
  Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
end, { noremap = true, silent = true, desc = "Find files current folder" })
