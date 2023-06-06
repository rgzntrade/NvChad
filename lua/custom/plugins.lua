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
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
    },
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
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
  },


  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "jcdickinson/codeium.nvim",
        { "tzachar/cmp-tabnine", build = "./install.sh"},
      },
    },
    opts = function()
      return require "custom.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
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
  -- You can use any plugin specification from lazy.nvim
  -- TODO 解除注释
  -- {
  --   "Pocco81/TrueZen.nvim",
  --   cmd = { "TZAtaraxis", "TZMinimalist" },
  --   config = function()
  --     require "custom.configs.truezen" -- just an example path
  --   end,
  -- },

  -- this opts will extend the default opts
  -- TODO 解除注释
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {"html", "css", "bash"},
  --   },
  -- },

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
