return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        tailwindcss = function(_, opts)
          local tw = LazyVim.lsp.get_raw_config("tailwindcss")
          opts.filetypes = opts.filetypes or {}

          -- Add default filetypes
          vim.list_extend(opts.filetypes, tw.default_config.filetypes)

          -- Remove excluded filetypes
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, opts.filetypes)

          -- Additional settings for Phoenix projects
          opts.settings = {
            tailwindCSS = {
              includeLanguages = {
                elixir = "html-eex",
                eelixir = "html-eex",
                heex = "html-eex",
                eruby = "html-eex",
                ruby = "html",
              },
            },
            experimental = {
              classRegex = {
                'class:\\s*"([^"]*)"', -- For class: "..."
                "class:\\s*'([^']*)'", -- For class: '...'
                -- Pattern to match { "tailwind classes here" }
                '{\\s*"([^"]*)"\\s*}', -- For { "" }
                -- Also include single quotes for consistency
                "{\\s*'([^']*)'\\s*}", -- For  { '' }
              },
            },
          }

          -- Add additional filetypes
          vim.list_extend(opts.filetypes, opts.filetypes_include or {})
        end,
      },
    },
  },
}
