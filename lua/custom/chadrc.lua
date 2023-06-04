--i-`type ChadrcConfig
local M = {}
M.ui = { theme = "onedark" }
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
M.ui = {
  statusline = {
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.default"
      -- this is just default table of statusline modules
  
      return {
        mode = function()
          return st_modules.mode() .. " bruh " 
          -- or just return "" to hide this module
        end,
      }
    end,
  },
}

return M
