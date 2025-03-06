return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = true,
        only_scope = false,
        only_current = false,
      },
      picker = {
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
    },
  },
}
