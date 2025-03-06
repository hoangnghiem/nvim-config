return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>r", group = "rails", icon = { icon = "", color = "red" } },
        },
      },
    },
  },
}
