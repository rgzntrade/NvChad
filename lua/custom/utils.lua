local M = {}
M.system = {
  is_windows = function()
    local result = vim.api.nvim_eval "has('win32') || has('win64')"
    return result == 1
  end,

  is_linux = function()
    local result = vim.api.nvim_eval "has('unix') && !has('mac') && !has('win32') && !has('win64')"
    return result == 1
  end,

  is_mac = function()
    local result = vim.api.nvim_eval "has('mac')"
    return result == 1
  end,
}
return M
