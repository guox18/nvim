-- Python LSP 配置
return {
  -- 配置 pyright LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- pyright 会通过 mason 自动安装
        pyright = {
          settings = {
            python = {
              -- 自动使用终端激活的 Python 环境
              pythonPath = (function()
                -- 优先使用 venv
                if vim.env.VIRTUAL_ENV then
                  return vim.env.VIRTUAL_ENV .. "/bin/python"
                -- 其次使用 conda
                elseif vim.env.CONDA_PREFIX then
                  return vim.env.CONDA_PREFIX .. "/bin/python"
                -- 默认
                else
                  return "python3"
                end
              end)(),
            },
          },
        },
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

