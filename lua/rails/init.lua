local M = {}
local ts_utils = require("nvim-treesitter.ts_utils")

function M.toggle_rspec()
  local current_file = vim.fn.expand("%:p")
  local spec_dir = "/spec/" -- Assuming 'spec' is the directory for specs
  local source_dir = "/app/" -- Assuming 'app' for Ruby class files

  if string.match(current_file, spec_dir) then
    -- If in spec directory, go to app directory
    local new_file = current_file:gsub(spec_dir, source_dir):gsub("_spec%.rb$", ".rb")

    print(new_file)
    vim.cmd("edit " .. new_file)
  elseif string.match(current_file, source_dir) then
    -- If in app directory, go to spec directory
    local new_file = current_file:gsub(source_dir, spec_dir):gsub("%.rb$", "_spec.rb")
    print(new_file)
    vim.cmd("edit " .. new_file)
  else
    print("Not in a recognized Ruby class or RSpec file path.")
  end
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
