local M = {}
local ts_utils = require("nvim-treesitter.ts_utils")

function M.toggle_view_controller()
  local file = vim.fn.expand("%")

  -- Check if we're in a controller
  local controller_match = file:match("app/controllers/(.+)_controller%.rb$")
  if controller_match then
    local view_path = "app/views/" .. controller_match
    print(view_path)

    Snacks.picker.files({ cwd = view_path, title = "Views" })
    return
  end

  -- Check if we're in a view
  local view_match = file:match("app/views/(.+)/.*%.%a+$")
  if view_match then
    local controller_path = "app/controllers/" .. view_match .. "_controller.rb"

    vim.cmd("edit " .. controller_path)
    return
  end

  print("Not in a controller or a view file")
end

local function pluralize(name)
  if name:match("y$") then
    return name:gsub("y$", "ies") -- e.g., "category" -> "categories"
  elseif name:match("[sxz]$") or name:match("ch$") or name:match("sh$") then
    return name .. "es" -- e.g., "box" -> "boxes", "church" -> "churches"
  else
    return name .. "s" -- e.g., "account" -> "accounts"
  end
end

function M.toggle_migration()
  local current_file = vim.fn.expand("%:p") -- Full path of current file

  -- Case 1: In a model file (app/models/*.rb)
  if current_file:match("app/models/.*%.rb$") then
    local model_name = current_file:match("app/models/(.*)%.rb$")
    if not model_name then
      vim.notify("Failed to extract model name", vim.log.levels.ERROR)
      return
    end

    -- Use pluralized model name for migration search
    local table_name = pluralize(model_name)
    -- Search for migrations matching the pluralized table name
    local migration_files = vim.fn.glob("db/migrate/*_" .. table_name .. "*.rb", false, true)

    if #migration_files == 0 then
      vim.notify("No migration found for " .. model_name, vim.log.levels.WARN)
    elseif #migration_files == 1 then
      vim.cmd.edit(migration_files[1]) -- Directly open if single match
    else
      -- Prepare items for snacks.nvim picker
      local items = {}
      for _, file in ipairs(migration_files) do
        table.insert(items, {
          text = vim.fn.fnamemodify(file, ":t"), -- Filename only
          file = file, -- Full path for editing
        })
      end

      -- Use snacks.nvim picker for multiple migrations
      require("snacks.picker").pick({
        items = items,
        title = "Migrations",
        format = function(item)
          return { { item.text, "Normal" } }
        end, -- Display filename
        action = function(_, selected)
          vim.cmd.edit(selected.value)
        end, -- Open selected file
      })
    end
    return
  end

  -- Case 3: Not in a relevant file
  vim.notify("Not in a Rails model", vim.log.levels.INFO)
end

function M.toggle_rspec()
  local current_file = vim.fn.expand("%:p")
  local spec_dir = "/spec/" -- Assuming 'spec' is the directory for specs
  local source_dir = "/app/" -- Assuming 'app' for Ruby class files

  if string.match(current_file, spec_dir) then
    -- If in spec directory, go to app directory
    local new_file = current_file:gsub(spec_dir, source_dir):gsub("_spec%.rb$", ".rb")

    vim.cmd("edit " .. new_file)
  elseif string.match(current_file, source_dir) then
    -- If in app directory, go to spec directory
    local new_file = current_file:gsub(source_dir, spec_dir):gsub("%.rb$", "_spec.rb")
    vim.cmd("edit " .. new_file)
  else
    print("Not in a recognized Ruby class or RSpec file path.")
  end
end

function M.find_js_files()
  -- Define the project root and vite path
  local project_root = vim.fn.getcwd() -- Current working directory as project root
  local vite_path = project_root .. "/app/vite"
  if vim.fn.isdirectory(vite_path) == 0 then
    vim.notify("No app/vite directory found", vim.log.levels.WARN)
    return
  end

  -- Find all .js files recursively under app/vite
  local js_files = vim.fn.glob(vite_path .. "/**/*.js", false, true)
  if #js_files == 0 then
    vim.notify("No JavaScript files found in app/vite", vim.log.levels.WARN)
    return
  end

  -- Prepare items for the picker with relative paths
  local items = {}
  for _, file in ipairs(js_files) do
    -- Strip the project root to get relative path
    local relative_path = file:gsub("^" .. project_root:gsub("[%-%.%+%[%]%(%)%$%^%%%?%*]", "%%%1") .. "/", "")
    table.insert(items, {
      text = relative_path, -- Relative path from project root (e.g., "app/vite/components/Button.js")
      file = file, -- Full path for editing
    })
  end

  -- Open picker with custom title
  require("snacks.picker").pick({
    items = items,
    title = "JavaScript Files",
    format = function(item)
      return { { item.text, "Normal" } }
    end,
    action = function(_, selected)
      vim.cmd.edit(selected.file)
    end,
  })
end

function M.find_css_files()
  -- Define the project root and vite path
  local project_root = vim.fn.getcwd() -- Current working directory as project root
  local vite_path = project_root .. "/app/vite"
  if vim.fn.isdirectory(vite_path) == 0 then
    vim.notify("No app/vite directory found", vim.log.levels.WARN)
    return
  end

  -- Find all .js files recursively under app/vite
  local css_files = vim.fn.glob(vite_path .. "/**/*.css", false, true)
  if #css_files == 0 then
    vim.notify("No CSS files found in app/vite", vim.log.levels.WARN)
    return
  end

  -- Prepare items for the picker with relative paths
  local items = {}
  for _, file in ipairs(css_files) do
    -- Strip the project root to get relative path
    local relative_path = file:gsub("^" .. project_root:gsub("[%-%.%+%[%]%(%)%$%^%%%?%*]", "%%%1") .. "/", "")
    table.insert(items, {
      text = relative_path, -- Relative path from project root (e.g., "app/vite/components/Button.js")
      file = file, -- Full path for editing
    })
  end

  -- Open picker with custom title
  require("snacks.picker").pick({
    items = items,
    title = "CSS Files",
    format = function(item)
      return { { item.text, "Normal" } }
    end,
    action = function(_, selected)
      vim.cmd.edit(selected.file)
    end,
  })
end

-- Get the current node under the cursor
local function get_current_node()
  local node = ts_utils.get_node_at_cursor()
  while node do
    if node:type() == "class" or node:type() == "module" then
      return node
    end
    node = node:parent()
  end
end

-- Get the full qualified class name by traversing class/module nodes
local function get_fully_qualified_class_name()
  local node = get_current_node()
  if not node then
    return nil
  end

  local parts = {}

  -- Traverse up to collect the class/module names
  while node do
    if node:type() == "class" or node:type() == "module" then
      -- Get the name of the class/module (2nd child is the name)
      local name_node = node:child(1)
      if name_node then
        table.insert(parts, 1, ts_utils.get_node_text(name_node)[1])
      end
    end
    node = node:parent()
  end

  -- Join the parts to form the fully qualified name
  return table.concat(parts, "::")
end

-- Copy the fully qualified class name to clipboard
function M.copy_fully_qualified_class_name()
  local class_name = get_fully_qualified_class_name()
  if class_name then
    vim.fn.setreg("+", class_name) -- Copy to system clipboard
    print("Copied: " .. class_name)
  else
    print("No class/module found")
  end
end

return M
