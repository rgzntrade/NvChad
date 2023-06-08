local plugins = {

  -- TODO 解除注释
  -- { "elkowar/yuck.vim" , lazy = false },  -- load a plugin at startup
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      -- require "custom.configs.lspconfig"
    end,
  },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", " " },
    config = function()
      require "custom.configs.which-key"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {

      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "kkharji/sqlite.lua",
    },
    config = function()
      require "plugins.configs.telescope"
      require "custom.configs.telescope"
    end,
  },

  {
    "stevearc/dressing.nvim",
    opts = {},
    config = function()
      require "custom.configs.dressing"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "custom.debug-dap.dap-config"
      require "custom.debug-dap.dap-ui"
      require "custom.debug-dap.dap-virtual-text"
      require "custom.debug-dap.dap-util"
    end,
  },

  {
    "Shatur/neovim-cmake",
    event = "VeryLazy",
    config = function()
      require "custom.configs.neovim-cmake"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      config = function()
        require "custom.configs.notify"
      end,
    },
    config = function()
      require "custom.configs.noice"
    end,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    dependencies = {
      "tpope/vim-repeat",
    },
    config = function()
      require "custom.configs.leap"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "cmp_tabnine" },
        { name = "codeium" },
      },
    },

    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {} -- put your options here
        end,
      },
      {
        "jcdickinson/codeium.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        config = function()
          require("codeium").setup {}
        end,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "custom.configs.lualine"
    end,
  },

  {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
      require "custom.configs.nvim-session-manager"
    end,
  },

  -- this opts will extend the default opts
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "cpp", "bash", "python", "lua", "rust", "yaml", "json", "toml", "cmake" },
    },
    dependencies = {
      "romgrk/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "clang-format",
        "rust-analyzer",
        "rustfmt",
        "pylyzer",
        "bash-language-server",
        "yaml-language-server",
        "json-lsp",
        "taplo",
        "codelldb",
        "debugpy",
        "sonarlint-language-server",
        "blue",
        "prettier",
        "cmake-language-server",
        "cmakelang",
      }, -- not an option from mason.nvim
    },
  },

  -- if you load some function or module within your opt, wrap it with a function
  -- TODO 解除注释
  -- {
  --  "nvim-telescope/telescope.nvim",
  --  opts = {
  --    defaults = {
  --      mappings = {
  --        i = {
  --          ["<esc>"] = function(...)
  --              require("telescope.actions").close(...)
  --           end,
  --         },
  --       },
  --     },
  --   },
  --  },

  -- TODO 解除注释
  -- {
  --   "folke/which-key.nvim",
  --   enabled = false,
  -- }
}

return plugins
