-- nord.nvim 主题配置（亮色模式）
return {
  -- 添加 nord 主题插件
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- 启用亮色模式
      vim.o.background = "light"
    end,
  },

  -- 配置 LazyVim 使用 nord 主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}

