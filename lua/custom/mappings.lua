local M = {}

-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    -- ["<C-a>"] = ""

    -- Clear highlights
    ["<Esc>"] = "",

    -- switch between windows
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",

    -- go to  beginning and end
    ["<C-b>"] = "",
    ["<C-e>"] = "",

    -- Telescope
    ["<leader>ff"] = "",
    ["<leader>fa"] = "",
    ["<leader>fw"] = "",
    ["<leader>fb"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>fz"] = "",

    -- git
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",

    -- pick a hidden term
    ["<leader>pt"] = "",

    -- theme switcher
    ["<leader>th"] = "",

    ["<leader>ma"] = "",
  },
  -- i = {
  --   -- go to  beginning and end
  -- }
}

-- Your custom mappings
M.abc = {
  n = {

    -- ["<Esc>"] = { ":noh <CR>", "Clear highlights", opt },
    -- switch between windows
    ["<leader>wh"] = { "<C-w>h", "Window left" },
    ["<leader>wl"] = { "<C-w>l", "Window right" },
    ["<leader>wj"] = { "<C-w>j", "Window down" },
    ["<leader>wk"] = { "<C-w>k", "Window up" },
    -- 分屏
    ["<leader>w_"] = { ":vsp<CR>", "Window split vertical", opt },
    ["<leader>w-"] = { ":sp<CR>", "Window split horizontal", opt },
    ["<leader>wc"] = { "<C-w>c", "Window close" },
    ["<leader>wo"] = { "<C-w>o", "Window close other" },
    -- 左右比例控制
    ["<leader><leader>l"] = { ":vertical resize -20<CR>", "向右扩展" },
    ["<leader><leader>h"] = { ":vertical resize +20<CR>", "向左扩展" },
    ["<leader><leader>k"] = { ":resize +10<CR>", "向上扩展" },
    ["<leader><leader>j"] = { ":resize -10<CR>", "向下扩展" },
    ["<leader><leader>="] = { "<C-w>=", "等比显示" },
    -- Telescope
    ["<leader>tf"] = { ":Telescope find_files<CR>", "Telescope 文件名称搜索" },
    ["<leader>tF"] = { ":Telescope live_grep<CR>", "Telescope 文件内容搜索" },
    ["<leader>tb"] = { ":Telescope buffers<CR>", "Telescope buffer名称搜索" },
    ["<leader>tm"] = { ":Telescope marks<CR>", "Telescope marks搜索" },
    ["<leader>tk"] = { ":Telescope keymaps<CR>", "Telescope 按键搜索" },
    ["<leader>th"] = { ":Telescope help_tags<CR>", "Telescope 帮助文档搜索" },
    ["<leader>tr"] = { ":Telescope registers<CR>", "Telescope 寄存器搜索" },
    ["<leader>tc"] = { ":Telescope commands<CR>", "Telescope 命令搜索" },
    ["<leader>to"] = { ":Telescope oldfiles<CR>", "Telescope 历史文件搜索" },
    ["<leader>tz"] = { ":Telescope current_buffer_fuzzy_find<CR>", "Telescope 当前文件搜索" },
    ["<leader>tgm"] = { ":Telescope git_commits<CR>", "Telescope git commits" },
    ["<leader>tgs"] = { ":Telescope git_status<CR>", "Telescope git status" },
    ["<leader>tts"] = { ":Telescope terms<CR>", "Telescope 选隐藏终端" },
    ["<leader>ttc"] = { ":Telescope themes<CR>", "Telescope 选主题" },
    -- term
    ["<leader>sh"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>sv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },

  i = {
    -- insert 模式下，跳到行首行尾
    ["<C-h>"] = { "<ESC>I" },
    ["<C-l>"] = { "<ESC>A" },
  },
}

return M
