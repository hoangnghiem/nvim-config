return {
  {
    "stevearc/conform.nvim",
    opts = function()
      return {
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
          javascript = { "prettierd", "rustywind" },
          json = { "prettierd", "fixjson" },
          css = { "prettierd", "rustywind" },
          html = { "prettierd" },
          svelte = { "prettierd", "rustywind" },
          ruby = { "rubocop" },
          eruby = { "htmlbeautifier", "rustywind" },
        },
        formatters = {
          htmlbeautifier = function(bufnr)
            return {
              command = "/home/hoang/.local/share/mise/installs/ruby/3.3.6/bin/htmlbeautifier",
              args = {
                "--keep-blank-lines",
                "1",
              },
              stdin = true,
            }
          end,
          -- Tailwind class sorter
          -- rustywind = function(bufnr)
          --   return {
          --     command = "rustywind",
          --     stdin = true,
          --   }
          -- end,
          -- rubocop = {
          --   command = "rubocop",
          --   args = { "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
          -- },
        },
      }
    end,
  },
}
