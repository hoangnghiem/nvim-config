return {
  "terryma/vim-expand-region",
  keys = {
    { "<C-e>", "<Plug>(expand_region_expand)", mode = { "n", "v", "o" }, desc = "Expand region" },
    { "<C-S-e>", "<Plug>(expand_region_shrink)", mode = { "n", "v", "o" }, desc = "Shrink region" },
  },
  init = function()
    -- Customize expand region mappings (optional)
    vim.g.expand_region_text_objects = {
      ["iw"] = 0, -- word
      ["iW"] = 0, -- WORD
      ['i"'] = 0, -- quotes
      ["i'"] = 0, -- single quotes
      ["i]"] = 1, -- brackets
      ["ib"] = 1, -- blocks
      ["iB"] = 1, -- curly braces
      ["ip"] = 1, -- paragraphs
      ["ie"] = 1, -- entire content
      ["it"] = 1, -- entire content
      ["at"] = 1, -- entire content
      ["ae"] = 1, -- around ERB tag
      ["iE"] = 1, -- inner ERB tag content (with %)
      ["aE"] = 1, -- around ERB tag (with %)
      ["i>"] = 1, -- inside angle brackets
      ["a>"] = 1, -- around angle brackets
      -- ["a%"] = 1, -- around `<% %>`
      -- ["i%"] = 1, -- inside `<% %>`
      -- ["ae="] = 1, -- around `<%= %>`
      -- ["ie="] = 1, -- inside `<%= %>`
      -- ["ae-"] = 1, -- around `<%- %>`
      -- ["ie-"] = 1, -- inside `<%- %>`
    }
  end,
}
