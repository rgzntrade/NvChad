require "custom.basic"


function is_windows()
  local result = vim.api.nvim_eval("has('win32') || has('win64')")
  return result == 1
end

function is_linux()
  local result = vim.api.nvim_eval("has('unix') && !has('mac') && !has('win32') && !has('win64')")
  return result == 1
end

function is_mac()
  local result = vim.api.nvim_eval("has('mac')")
  return result == 1
end

if is_linux() then
  -- Unix-like 系统的配置
  print("is unix")
elseif is_mac() then
  print("is mac")
elseif is_windows() then
  -- Windows 系统的配置
  print("is windows")
end
