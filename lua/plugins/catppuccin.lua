-- catppuccin 主题配置（latte 亮色模式）
return {
  -- 添加 catppuccin 主题插件
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "latte", -- latte（亮色）, frappe, macchiato, mocha（暗色）
    },
  },

  -- 配置 LazyVim 使用 catppuccin 主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

