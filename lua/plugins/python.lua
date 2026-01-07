-- Python LSP 配置
return {
  -- 配置 pyright LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- pyright 会通过 mason 自动安装
        pyright = {},
      },
    },
  },

  -- 确保 Mason 自动安装 Python 工具
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright", -- Python LSP
        "ruff",    -- Python linter/formatter (可选)
      },
    },
  },

  -- 确保安装 Python treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}

