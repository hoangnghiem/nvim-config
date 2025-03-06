return {
  {
    "nvimtools/hydra.nvim",
    opts = {
      debug = false,
      hint = false,
    },
    config = function()
      local Hydra = require("hydra")

      Hydra({
        debug = false,
        name = "Buffer",
        mode = "n",
        body = ",,",
        hint = false,
        heads = {
          { "l", "<cmd>bnext<cr>", { desc = "Next" } },
          { "h", "<cmd>bprevious<cr>", { desc = "Previous" } },
          {
            "c",
            function()
              Snacks.bufdelete()
            end,
            { desc = "Close" },
          },
          { "<Esc>", nil, { exit = true, desc = "Quit" } },
          { "q", nil, { exit = true, desc = "Quit" } },
        },
      })

      Hydra({
        debug = false,
        name = "Window",
        mode = "n",
        body = ",w",
        hint = false,
        heads = {
          { "h", "<C-w>h", { desc = "Move left" } },
          { "j", "<C-w>j", { desc = "Move down" } },
          { "k", "<C-w>k", { desc = "Move up" } },
          { "l", "<C-w>l", { desc = "Move right" } },
          { "c", "<C-w>c", { desc = "Close" } },
          { "=", "<C-w>=", { desc = "Equalize" } },
          { "<", "<C-w><", { desc = "Decrease width" } },
          { ">", "<C-w>>", { desc = "Increase width" } },
          { "+", "<C-w>+", { desc = "Increase height" } },
          { "-", "<C-w>-", { desc = "Decrease height" } },
          { "v", "<C-w>v", { desc = "Split vertical" } },
          { "s", "<C-w>s", { desc = "Split horizontal" } },
          { "<Esc>", nil, { exit = true, desc = "Quit" } },
          { "q", nil, { exit = true, desc = "Quit" } },
        },
      })
    end,
  },
}
