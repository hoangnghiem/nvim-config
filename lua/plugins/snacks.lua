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
      scratch = {
        win = {
          width = 0.8,
          height = 0.7,
        },
      },
    },
  },
}
