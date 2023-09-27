local M = {}

-- Function to merge two tables, combining lists for the same key
local function merge_tables(lhs, rhs)
  local result = {}

  -- Copy all values from the first table to the result
  for key, value in pairs(lhs) do
    result[key] = value
  end

  -- Merge the values from the second table into the result
  for key, value in pairs(rhs) do
    if result[key] == nil then
      -- If the key doesn't exist in the first table, simply add it
      result[key] = value
    elseif type(result[key]) == "table" and type(value) == "table" then
      -- If both values are tables, merge them
      result[key] = merge_tables(result[key], value)
    else
      -- Otherwise, insert the new value into the table as if it is a list
      table.insert(result, value)
    end
  end

  return result
end

M.merge_tables = merge_tables

return M
