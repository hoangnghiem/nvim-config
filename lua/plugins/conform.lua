return {
  {
    "stevearc/conform.nvim",
    opts = function()
      return {
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
          javascript = { "prettierd" },
          css = { "prettierd", "rustywind" },
          html = { "prettierd" },
          ruby = { "rubocop" },
          eruby = { "htmlbeautifier", "rustywind" },
        },
        formatters = {
          htmlbeautifier = function(bufnr)
            return {
              command = "/home/hoang/.rbenv/shims/htmlbeautifier",
              args = {
                "--keep-blank-lines",
                "1",
              },
              stdin = true,
            }
          end,
          -- Tailwind class sorter
          rustywind = function(bufnr)
            return {
              command = "rustywind",
              stdin = true,
            }
          end,
          rubocop = {
            command = "rubocop",
            args = { "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
          },
        },
      }
    end,
  },
}
