local M = {}

---Detect current os
---@return string one of: "Windows", "Linux", "Mac", "Unknown"
function M.get_os()
  local os_name = vim.loop.os_uname().sysname
  if os_name == "Windows_NT" then
    return "Windows"
  elseif os_name == "Darwin" then
    return "Mac"
  elseif os_name == "Linux" then
    return "Linux"
  else
    return "Unknown"
  end
end

-- Source - https://stackoverflow.com/a
-- Posted by Hisham H M
-- Retrieved 2025-11-20, License - CC BY-SA 3.0

--- Check if a file or directory exists in this path
function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

--- Check if a directory exists in this path
function isdir(path)
   -- "/" works on both Unix and Windows
   return exists(path.."/")
end

return M
