vim.lsp.set_log_level(vim.log.levels.ERROR)

local vscode = require("util.vscode")

vim.g.autoformat = vscode.get_setting("editor.formatOnSave")

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "VeryLazy" },
    opts = {
      diagnostics = {
        virtual_text = {
          source = false,
        },
      },
      servers = {
        unocss = {},
      },
    },
  },

  -- lspsaga
  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    event = { "LspAttach" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      ui = {
        title = false,
      },
      outline = {
        keys = {
          expand_or_jump = "<cr>",
        },
      },
      lightbulb = {
        enable = false,
        enable_in_insert = false,
      },
      -- breadcrumbs
      -- https://github.com/glepnir/lspsaga.nvim#lspsaga-symbols-in-winbar
      symbol_in_winbar = {
        enable = false,
      },
      beacon = {
        enable = false,
      },
      implement = {
        enable = false,
      },
      -- diagnostic = {
      --   extend_relatedInformation = true,
      -- },
    },
    config = function()
      -- for crates.nvim

      -- error lens
      vim.fn.sign_define({
        {
          name = "DiagnosticSignError",
          text = "",
          texthl = "DiagnosticSignError",
          linehl = "ErrorLine",
        },
        {
          name = "DiagnosticSignWarn",
          text = "",
          texthl = "DiagnosticSignWarn",
          linehl = "WarningLine",
        },
        {
          name = "DiagnosticSignInfo",
          text = "",
          texthl = "DiagnosticSignInfo",
          linehl = "InfoLine",
        },
        {
          name = "DiagnosticSignHint",
          text = "",
          texthl = "DiagnosticSignHint",
          linehl = "HintLine",
        },
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      log_level = vim.log.levels.ERROR,
      ensure_installed = {
        "stylua",
      },
    },
  },

  -- lsp settings
  {
    "tamago324/nlsp-settings.nvim",
    cmd = "LspSettings",
    opts = {},
  },

  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {},
  },
}
