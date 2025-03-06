-- return {
--   {
--     "L3MON4D3/LuaSnip",
--     dependencies = { "rafamadriz/friendly-snippets" },
--     config = function(plugin, opts)
--       require("luasnip.loaders.from_vscode").lazy_load()
--       require("luasnip").filetype_extend("ruby", { "rails" })
--       require("luasnip").filetype_extend("eruby", { "html" })
--       require("snippets.javascript")
--       require("snippets.erb")
--     end,
--   },
-- }
--
return {
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip").filetype_extend("eruby", { "html" })
      require("snippets.javascript")
      require("snippets.erb")
    end,
  },
}
