-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
  vim.notify "没有找到 lualine"
  return
end

lualine.setup {
  options = {
    theme = "onelight",
    component_separators = { left = "|", right = "|" },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = { left = " ", right = "" },
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        symbols = {
          unix = "", -- e712
          dos = "", -- e70f
          mac = "", -- e711
        },
        -- symbols = {
        --   unix = "LF",
        --   dos = "CRLF",
        --   mac = "CR",
        -- },
      },
      -- "message",
      -- {
      --   require("noice").api.status.message.get_hl,
      --   cond = require("noice").api.status.message.has,
      -- },
      "command",
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { fg = "#ff9e64" },
      },
      -- "mode",
      -- {
      --   require("noice").api.status.mode.get,
      --   cond = require("noice").api.status.mode.has,
      --   color = { fg = "#ff9e64" },
      -- },
      "search",
      {
        require("noice").api.status.search.get,
        cond = require("noice").api.status.search.has,
        color = { fg = "#ff9e64" },
      },
      "encoding",
      "filetype",
    },
  },
}
