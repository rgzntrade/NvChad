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

    -- which-key
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
  },
  -- i = {
  --   -- go to  beginning and end
  -- }
}

-- Your custom mappings
M.windows= {
  n = {
    -- switch between windows
    ["<leader>wh"] = { "<C-w>h", "移动到左侧窗口" },
    ["<leader>wl"] = { "<C-w>l", "移动到右侧窗口" },
    ["<leader>wj"] = { "<C-w>j", "移动到下方窗口" },
    ["<leader>wk"] = { "<C-w>k", "移动到上方窗口" },
    -- 分屏
    ["<leader>w_"] = { ":vsp<CR>", "纵向分屏", opt },
    ["<leader>w-"] = { ":sp<CR>", "横向分屏", opt },
    ["<leader>wc"] = { "<C-w>c", "关闭当前窗口" },
    ["<leader>wo"] = { "<C-w>o", "关闭其它窗口" },
    -- 左右比例控制
    ["<leader><leader>l"] = { ":vertical resize -20<CR>", "向右扩展" },
    ["<leader><leader>h"] = { ":vertical resize +20<CR>", "向左扩展" },
    ["<leader><leader>k"] = { ":resize +10<CR>", "向上扩展" },
    ["<leader><leader>j"] = { ":resize -10<CR>", "向下扩展" },
    ["<leader><leader>="] = { "<C-w>=", "等比显示" },
  },
}


M.telescope= {
  n = {
    -- switch between windows
    ["<leader>wh"] = { "<C-w>h", "移动到左侧窗口" },
    ["<leader>wl"] = { "<C-w>l", "移动到右侧窗口" },
    ["<leader>wj"] = { "<C-w>j", "移动到下方窗口" },
    ["<leader>wk"] = { "<C-w>k", "移动到上方窗口" },
    -- 分屏
    ["<leader>w_"] = { ":vsp<CR>", "纵向分屏", opt },
    ["<leader>w-"] = { ":sp<CR>", "横向分屏", opt },
    ["<leader>wc"] = { "<C-w>c", "关闭当前窗口" },
    ["<leader>wo"] = { "<C-w>o", "关闭其它窗口" },
    -- 左右比例控制
    ["<leader><leader>l"] = { ":vertical resize -20<CR>", "向右扩展" },
    ["<leader><leader>h"] = { ":vertical resize +20<CR>", "向左扩展" },
    ["<leader><leader>k"] = { ":resize +10<CR>", "向上扩展" },
    ["<leader><leader>j"] = { ":resize -10<CR>", "向下扩展" },
    ["<leader><leader>="] = { "<C-w>=", "等比显示" },
    -- Telescope
    ["<leader>tf"] = { ":Telescope find_files<CR>", "Telescope 文件名称搜索" },
    ["<leader>tF"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Telescope 所有文件名搜索" },
    ["<leader>tl"] = { ":Telescope live_grep<CR>", "Telescope 文件内容搜索" },
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
  },
}

M.nvterm = {
  n = {
    -- term
    ["<leader>sh"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "横向创建term",
    },

    ["<leader>sv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "纵向创建term",
    },
  },
}

M.nvim = {
  n = {
    -- 取消高亮
    ["<Esc>"] = { ":noh <CR>", "Clear highlights", opt },
  },

  i = {
    -- insert 模式下，跳到行首行尾
    ["<C-h>"] = { "<ESC>I", "移动到最左侧" },
    ["<C-l>"] = { "<ESC>A", "移动到最右侧" },
  },
}

return M
