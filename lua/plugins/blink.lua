return {
  {
    "saghen/blink.cmp",
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      {
        "Kaiser-Yang/blink-cmp-dictionary",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
      { "hoangnghiem/blink-cmp-rails-routes" },
    },
    opts = {
      snippets = { preset = "luasnip" },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        ghost_text = {
          enabled = false,
        },
      },
      keymap = {
        preset = "none",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<C-y>"] = { "select_and_accept" },
        ["<CR>"] = { "select_and_accept", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<C-g>"] = { "show_signature", "hide_signature", "fallback" },

        ["<C-o>"] = {
          function(cmp)
            cmp.show({ providers = { "dictionary" } })
          end,
        },
        ["<C-r>"] = {
          function(cmp)
            cmp.show({ providers = { "rails_routes" } })
          end,
        },
      },
      sources = {
        default = { "snippets", "lsp", "path", "buffer" },
        providers = {
          buffer = {
            opts = {
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr)
                  return vim.bo[bufnr].buftype == ""
                end, vim.api.nvim_list_bufs())
              end,
            },
          },
          dictionary = {
            module = "blink-cmp-dictionary",
            name = "Dict",
            min_keyword_length = 2,
            opts = {
              -- dictionary_directories = { vim.fn.expand("~/Workspaces/github/english-words") },
              dictionary_files = { "/usr/share/dict/words" },
              separate_output = function(output)
                local items = {}
                for line in output:gmatch("[^\r\n]+") do
                  table.insert(items, {
                    label = line,
                    insert_text = line,
                    documentation = nil,
                  })
                end
                return items
              end,
            },
          },
          rails_routes = {
            module = "blink-cmp-rails-routes",
            name = "Rails routes",
          },
        },
      },
    },
  },
}
