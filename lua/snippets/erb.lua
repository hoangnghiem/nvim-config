local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("eruby", {
  s(
    "%",
    fmt([[ <% {} %> ]], {
      i(1, "script"),
    })
  ),
  s(
    "=",
    fmt([[ <%= {} %> ]], {
      i(1, "output"),
    })
  ),
  s(
    "mf",
    fmt(
      [[
<%= with_requested_frame do -%>
  <%= tui_form_with model: {a}, scope: :form, url: {b}, method: :put do |f| -%>
    <%= tui_modal do |modal| -%>
      <% modal.with_header(title: "{c}") -%>
      <% modal.with_body do -%>
        <%= f.tui_base_error -%>
        {e}
      <% end -%>
      <% modal.with_footer do |c| -%>
        <%= f.tui_cancel {{ "Cancel" }} %>
        <%= f.tui_submit {{ "Save changes" }} %>
        <% c.with_addon do %>
          <%= tui_button(variant: :solid, color: :danger) {{ "{d}" }} %>
        <% end %>
      <% end -%>
    <% end -%>
  <% end -%>
<% end -%>
  ]],
      {
        a = i(1, "model"),
        b = i(2, "url"),
        c = i(3, "title"),
        d = i(4, "text"),
        e = i(5, "input"),
      }
    )
  ),
  s(
    "tbtn",
    fmt(
      [[
      <%= tui_button(icon: "{}") {{ "{}" }} %>
  ]],
      {
        i(1, "icon"),
        i(3, "text"),
      }
    )
  ),
  s(
    "tbtnl",
    fmt(
      [[
      <%= tui_button(icon: "{}", href: {}) {{ "{}" }} %>
  ]],
      {
        i(1, "icon"),
        i(2, "url"),
        i(3, "text"),
      }
    )
  ),
})
