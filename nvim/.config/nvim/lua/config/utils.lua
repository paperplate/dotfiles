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

return M
